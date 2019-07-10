module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 14,
    fontFamily: 'Fira Code, monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    css: '',
    termCSS:`
        x-screen x-row { font-variant-ligatures: initial; }
    `,
    showHamburgerMenu: '',
    showWindowControls: false,
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },
    shell: '/bin/zsh',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',
    // bellSoundURL: 'http://example.com/bell.mp3',
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,
    // Hyperterm Summon
    summon: {
      hideDock: false,
      hotkey: 'Alt+Space'
    },
    // Hyper Transparent
    hyperTransparent: {
      opacity: 0.6,
      vibrancy: 'ultra-dark'
    }
  },
  plugins: [
    'gitrocket',
    'hyper-dracula',
    'hyper-transparent',
    'hyperline',
    'hyperpower',
    'hyperterm-summon'
  ],
  localPlugins: [],
  keymaps: {
    'window:devtools': 'cmd+alt+i',
  },
};
