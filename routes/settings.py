NAVBARS = {
    'empty-root': {
        'title': 'Inicio',
        'items_exists': False
    },
    'empty-afectado': {
        'title': 'Afectado',
        'items_exists': False
    },
    'perfil-afectado': {
        'title': 'Afectado',
        'items_exists': True,
        'items': {
            'editar_datos': {
                'title': 'Mis datos',
                'url': None,
                'subitems_exist': True,
                'subitems':
                    {
                        'eliminar': {
                            'title': 'Eliminar mis datos',
                            'url': 'root.home'
                        },
                        'editar': {
                            'title': 'Ver y editar mis datos',
                            'url': 'root.home'
                        }
                    }
                }
        },
    }
}