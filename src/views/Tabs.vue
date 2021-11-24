<template>
  <ion-page>
    <!-- <ion-header>
      <ion-toolbar color="dark">
        <ion-thumbnail slot="start">
          <img src="/assets/pandoo.png" class="ion-margin-start"/>
        </ion-thumbnail>
        <ion-title class="ion-margin-start">Pandoo</ion-title>
      </ion-toolbar>
    </ion-header> -->

    <ion-tabs>
      <ion-router-outlet></ion-router-outlet>
      <ion-tab-bar slot="bottom">
        <ion-tab-button tab="tab1" href="/tabs/tab1">
          <ion-icon :icon="listCircle" />
          <ion-label>Tasks</ion-label>
        </ion-tab-button>
          
        <ion-tab-button tab="tab2" href="/tabs/tab2">
          <ion-icon :icon="checkmarkCircle" />
          <ion-label>Completed</ion-label>
        </ion-tab-button>
        
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script>
import { IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage, IonRouterOutlet } from '@ionic/vue';
import { listCircle, checkmarkCircle } from 'ionicons/icons';

export default {
  name: 'Tabs',
  components: { IonLabel, IonTabs, IonTabBar, IonTabButton, IonIcon, IonPage, IonRouterOutlet },
  setup() {
    return {
      listCircle,
      checkmarkCircle
    }
  }
}
</script>
