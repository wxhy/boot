import UserSelect from './src/main.vue';

UserSelect.install = function(Vue) {
    Vue.component(UserSelect.name, UserSelect);
};

export default UserSelect;