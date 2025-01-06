<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-thumbnail slot="start">
          <img src="/assets/pandoo.png" class="ion-margin-start"/>
        </ion-thumbnail>
        <ion-title>Pandoo</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Pandoo</ion-title>
        </ion-toolbar>
      </ion-header>
    
      <ion-list class="panda-list">
            <ion-item v-for="(item, index) in todoList" :key="index">
                <ion-label>{{item.data.title}}</ion-label>
                <ion-checkbox slot="end" @click="todoCompleted(index)" :checked="item.data.completed"></ion-checkbox>
            </ion-item>
      </ion-list>

    </ion-content>

    <ion-footer>
      <ion-toolbar class="panda-input">
        <ion-input maxlength="30" type="text" autocapitalize="on" v-model="todoInput" placeholder="Add a Task" v-on:keydown.enter="addTodo()"></ion-input>
        <ion-button slot="end" @click="addTodo()">Add</ion-button>
      </ion-toolbar>
    </ion-footer>
  </ion-page>
</template>

<script>
import { IonButton, IonCheckbox, IonTitle, IonThumbnail, IonHeader, IonInput, IonToolbar, IonFooter, IonList, IonItem, IonLabel, IonPage, IonContent } from '@ionic/vue';
import { Keyboard } from '@capacitor/keyboard';

import Localbase from 'localbase'
let db = new Localbase('db')

export default  {
  name: 'Tab1',
  components: { IonButton, IonCheckbox, IonTitle, IonThumbnail, IonHeader, IonInput, IonToolbar, IonFooter, IonList, IonItem, IonLabel, IonPage, IonContent },
  data: () => ({
    todoList: [],
    todoInput: "",
    reorderMode: false
  }),
  methods: {
    addTodo() {
      if (this.todoInput.length > 0) {
        this.todoInput = this.todoInput.charAt(0).toUpperCase() + this.todoInput.slice(1)

        db.collection('todos').add({
          title: this.todoInput,
          completed: false,
          index: this.todoList.length
        }).then(() => {
          Keyboard.hide()
          this.todoInput = "";
          this.fetchToDos();
        })
      }
    },
    fetchToDos() {
      db.collection('todos').get({ keys: true }).then(todos => {
        this.todoList = []
        todos.forEach(doc => {
          if (!doc.data.completed) {
            this.todoList.push({
            id: doc.key,
            data: {
              title: doc.data.title,
              completed: doc.data.completed,
              index: doc.data.index
            }
            })
          }
        })
      })
    },
    todoCompleted(index) {
      let completedChange = !this.todoList[index].data.completed
      db.collection('todos').doc(this.todoList[index].id).update({
        completed: completedChange
      }).then(() => {
        this.todoList[index].data.completed = completedChange
      })
    }
  },
  created() {
      this.fetchToDos()
  },
  watch:{
    $route (){
        this.fetchToDos()
    }
} 
}
</script>

<style scoped>
.panda-list {
  margin-top: 10px;
  padding: 0px 0px 0px 20px;
}
.panda-input {
  padding: 0px 20px 0px 20px;
}
</style>