<template>
  <div class="table-container">
    <b-table striped hover :items="trains" :fields="fields">
      <template v-slot:cell(delete)="data">
        <b-button class="delete-btn" @click="showMsgBoxTwo(data.item.id)"> <b-icon
            icon="trash"></b-icon></b-button>
      </template>
    </b-table>
    <b-button class="add-train-btn" v-b-modal.modal-prevent-closing @click="openAddModal">Ajouter un train</b-button>
    <AddTrainModal ref="addTrainModal" v-if="showModal" @close="closeAddModal"
      @trainAddedSuccessfully="trainAddedSuccessfully"></AddTrainModal>
  </div>
</template>

<script>
import axios from 'axios'
import AddTrainModal from '@/components/AddTrainModal.vue'
import DeleteTrainModal from '@/components/DeleteTrainModal.vue'

export default {
  components: {
    AddTrainModal,
    DeleteTrainModal
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
      showModal: false
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
          console.log(this.items)
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
    openAddModal () {
      this.showModal = true
    },
    closeAddModal () {
      this.showModal = false
    },
    trainAddedSuccessfully () {
      this.fetchTrains()
    },
    showMsgBoxTwo (id) {
      this.$bvModal.msgBoxConfirm(`Êtes-vous sûr de vouloir supprimer le train numéro : ${id} ?`, {
        title: 'Confirmer la supression',
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
.table-container {
  margin-top: 100px;
}

.delete-btn {
  background-color: #C75C5C;
  border-color: #C75C5C;
}

.add-train-btn {
  background-color: #4e5d72;
  border-color: #4e5d72;
}
</style>
