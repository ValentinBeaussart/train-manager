<template>
  <div>
    <h1  class="title">Prochain départ</h1>
    <div class="train-table-container">
      <div class="filters">
        <b-form-input class="search-input" v-model="destinationFilter" placeholder="Filtrer par destination"></b-form-input>
        <b-form-input class="search-input mt-2" v-model="departureTimeFilter" placeholder="Filtrer par heure de départ"></b-form-input>
      </div>
      <b-table class="train-table" striped hover :items="filteredTrains" :fields="fields">
        <template v-slot:cell(delete)="data">
          <b-button class="delete-btn" @click="showMsgBoxTwo(data.item.id)"><b-icon icon="trash"></b-icon></b-button>
        </template>
      </b-table>
      <b-button variant="secondary" class="add-train-btn" v-b-modal.modal-prevent-closing @click="openModal('addTrain')">Ajouter un train</b-button>
      <b-button variant="secondary" class="add-destination-btn" v-b-modal.modal-prevent-closing @click="openModal('addDestination')">Ajouter une destination</b-button>
      <b-button variant="secondary" class="update-delete-destination-btn" v-b-modal.modal-prevent-closing @click="openModal('updateDeleteDestination')">Mettre à jour ou supprimer une destination</b-button>

      <AddTrainModal ref="addTrainModal" v-if="showModal.addTrain" @close="closeModal('addTrain')" @trainAddedSuccessfully="trainAddedSuccessfully"></AddTrainModal>
      <AddDestinationModal ref="addDestinationModal" v-if="showModal.addDestination" @close="closeModal('addDestination')"></AddDestinationModal>
      <UpdateDeleteDestinationModal ref="updateDeleteDestinationModal" v-if="showModal.updateDeleteDestination" @close="closeModal('updateDeleteDestination')"></UpdateDeleteDestinationModal>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import AddTrainModal from '@/components/AddTrainModal.vue'
import AddDestinationModal from '@/components/AddDestinationModal.vue'
import UpdateDeleteDestinationModal from './UpdateDeleteDestinationModal.vue'

export default {
  components: {
    AddTrainModal,
    AddDestinationModal,
    UpdateDeleteDestinationModal
  },
  data () {
    return {
      fields: [
        {
          key: 'id',
          label: 'ID'
        },
        {
          key: 'destination_name',
          label: 'Destination'
        },
        {
          key: 'departure_time',
          label: 'Départ'
        },
        {
          key: 'arrival_time',
          label: 'Arrivée'
        },
        {
          key: 'station_platform',
          label: 'Quai'
        },
        {
          key: 'delete',
          label: 'Supprimer'
        }
      ],
      trains: [],
      destinationFilter: '',
      departureTimeFilter: '',
      showModal: {
        addTrain: false,
        addDestination: false,
        updateDeleteDestination: false
      }
    }
  },
  computed: {
    filteredTrains () {
      return this.trains.filter(train => {
        return (
          train.destination_name.toLowerCase().includes(this.destinationFilter.toLowerCase()) &&
          train.departure_time.toLowerCase().includes(this.departureTimeFilter.toLowerCase())
        )
      })
    }
  },
  created () {
    this.fetchTrains()
  },
  methods: {
    fetchTrains () {
      axios.get('http://localhost:3000/api/v1/trains')
        .then(response => {
          this.trains = response.data
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la récupération des trains : ', error)
        })
    },
    deleteTrain (id) {
      axios.delete('http://localhost:3000/api/v1/trains/' + id)
        .then(response => {
          this.fetchTrains()
        })
        .catch(error => {
          console.error('Une erreur s\'est produite lors de la suppression du train : ', error)
        })
    },
    openModal (modalName) {
      for (const key in this.showModal) {
        if (key !== modalName) {
          this.showModal[key] = false
        }
      }
      this.showModal[modalName] = true
    },
    closeModal (modalName) {
      this.showModal[modalName] = false
    },
    trainAddedSuccessfully () {
      this.fetchTrains()
    },
    showMsgBoxTwo (id) {
      this.$bvModal.msgBoxConfirm(`Êtes-vous sûr de vouloir supprimer le train numéro : ${id} ?`, {
        title: 'Confirmer la suppression',
        size: 'm',
        buttonSize: 'm',
        okVariant: 'danger',
        okTitle: 'CONFIRMER',
        cancelTitle: 'ANNULER',
        footerClass: 'p-2',
        hideHeaderClose: true,
        centered: true
      })
        .then(value => {
          if (value) {
            this.deleteTrain(id)
          }
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>

<style scoped>
.search-input {
  width: 30%;
  margin-left: 50px;
}

.train-table-container {
  margin-top: 50px;
}

.title {
  margin-top: 100px;
}

.delete-btn {
  background-color: #C75C5C;
  border-color: #C75C5C;
}

.filters {
  margin-bottom: 20px;
}
</style>
