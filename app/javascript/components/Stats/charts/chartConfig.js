// グラフのtheme color
const ITEM_COLORS = [
  '#D896AD',
  '#ECA2A3',
  '#F1B996',
  '#F6D699',
  '#E3DE9A',
  '#A6D29A',
  '#93C7B7',
  '#92BFC7',
  '#90B0CA',
  '#8FACD0',
  '#B5A4C7',
  '#C59DBB',
]

const allPieOptions = {
  plugins: {
    tooltip: {
      callbacks: {
        label: context => `${context.label}: ${context.parsed}時間`,
      },
    },
  },
  maintainAspectRatio: false,
};

const allLineOptions = {
  plugins: {
    tooltip: {
      callbacks: {
        label: context => `${context.dataset.label}: ${context.raw}時間`,
        title: () => "",
      },
    },
  },
  maintainAspectRatio: false,
};

export { ITEM_COLORS, allPieOptions, allLineOptions }