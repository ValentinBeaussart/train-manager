<template>
  <div class="mt-4">
    <b-table striped hover :items="items"></b-table>
  </div>
</template>

<script>
export default {
  data () {
    return {
      items: [
        { id: 40, destination: 'Dickerson', départ: 'Macdonald', arrivée: 'Macdonald', quai: 'B' },
        { id: 40, destination: 'Dickerson', départ: 'Macdonald', arrivée: 'Macdonald', quai: 'B' },
        { id: 40, destination: 'Dickerson', départ: 'Macdonald', arrivée: 'Macdonald', quai: 'B' },
        { id: 40, destination: 'Dickerson', départ: 'Macdonald', arrivée: 'Macdonald', quai: 'B' }
      ]
    }
  }
}
</script>
