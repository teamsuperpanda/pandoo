<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-thumbnail slot="start">
          <img src="/assets/pandoo.png" class="ion-margin-start"/>
        </ion-thumbnail>
        <ion-title>Completed</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Completed</ion-title>
        </ion-toolbar>
      </ion-header>
    
      <ion-list class="panda-list">
          <ion-item v-for="(item, index) in completedList" :key="index">
              <ion-label>{{item.data.title}}</ion-label>
              <ion-checkbox slot="end" @click="unmarkCompleted(index)" :checked="item.data.completed"></ion-checkbox>
              <!-- <ion-reorder></ion-reorder> -->
          </ion-item>
      </ion-list>
    </ion-content>

    <ion-footer v-if="completedList.length > 0">
      <ion-toolbar class="panda-input">
        <ion-button color="danger" @click="deleteCompleted()">Delete Completed</ion-button>
      </ion-toolbar>
    </ion-footer>

  </ion-page>
</template>

<script>
import { IonFooter, IonButton, IonCheckbox, IonTitle, IonThumbnail, IonHeader, IonToolbar, IonList, IonItem, IonLabel, IonPage, IonContent } from '@ionic/vue';

import Localbase from 'localbase'
let db = new Localbase('db')

export default  {
  name: 'Tab2',
  components: { IonFooter, IonButton, IonCheckbox, IonTitle, IonThumbnail, IonHeader, IonToolbar, IonList, IonItem, IonLabel, IonPage, IonContent },
  data: () => ({
    completedList: [],
  }),
  methods: {
    fetchCompleted() {
      db.collection('todos').get({ keys: true }).then(todos => {
        this.completedList = []
        todos.forEach(doc => {
          if (doc.data.completed) {
            this.completedList.push({
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
    unmarkCompleted(index) {
      // change data.completed
      let completedChange = !this.completedList[index].data.completed
      // change data.completed in db
      db.collection('todos').doc(this.completedList[index].id).update({
        completed: completedChange
      }).then(() => {
        // change data.completed in vue
        this.completedList[index].data.completed = completedChange
      })
    },
    deleteCompleted() {
      db.collection('todos').get({ keys: true }).then(todos => {
        todos.forEach(doc => {
          if (doc.data.completed) {
            db.collection('todos').doc(doc.key).delete()
          }
        })
      }).then(() => {
        this.fetchCompleted()
      })
    }
  },
  created() {
      this.fetchCompleted()
  },
  watch:{
    $route (){
        this.fetchCompleted()
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
  text-align: center;
}
</style>