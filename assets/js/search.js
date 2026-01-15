// 全局搜索功能
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const searchBtn = document.querySelector('.search-btn');

    if (searchInput && searchBtn) {
        // 搜索按钮点击事件
        searchBtn.addEventListener('click', performSearch);

        // 回车键搜索
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }
});

function performSearch() {
    const searchInput = document.getElementById('searchInput');
    const query = searchInput.value.trim().toLowerCase();

    if (!query) {
        alert('请输入搜索关键词');
        return;
    }

    // 搜索数据定义
    const searchData = {
        packages: [
            { title: '经典北环5日游', url: '/packages/classic-northern-5day', keywords: ['经典', '北环', '5天', '首次', '塞伦盖蒂', '恩戈罗恩戈罗'] },
            { title: '经济型北环3日快闪', url: '/packages/budget-northern-3day', keywords: ['经济', '3天', '背包', '学生', '预算'] },
            { title: '塞伦盖蒂+桑给巴尔8日蜜月', url: '/packages/honeymoon-serengeti-zanzibar-8day', keywords: ['蜜月', '8天', '桑给巴尔', '海滩', '情侣'] },
            { title: '乞力马扎罗7日+塞伦盖蒂3日', url: '/packages/kilimanjaro-7day-serengeti-3day', keywords: ['乞力马扎罗', '登山', '7天', '挑战'] },
            { title: '大迁徙专题10日追踪', url: '/packages/migration-special-10day', keywords: ['大迁徙', '10天', '马拉河', '过河'] },
        ],
        destinations: [
            { title: '塞伦盖蒂国家公园', url: '/destinations/serengeti', keywords: ['塞伦盖蒂', '大迁徙', '狮子', '猎豹'] },
            { title: '恩戈罗恩戈罗保护区', url: '/destinations/ngorongoro', keywords: ['恩戈罗恩戈罗', '火山口', '犀牛', '黑犀牛'] },
            { title: '塔兰吉雷国家公园', url: '/destinations/tarangire', keywords: ['塔兰吉雷', '大象', '猴面包树'] },
            { title: '桑给巴尔岛', url: '/destinations/zanzibar', keywords: ['桑给巴尔', '海滩', '石头城', '香料'] },
        ],
        wildlife: [
            { title: '非洲狮', url: '/wildlife/african-lion', keywords: ['狮子', '狮', '万兽之王'] },
            { title: '非洲草原象', url: '/wildlife/african-elephant', keywords: ['大象', '象', '陆地最大'] },
            { title: '非洲豹', url: '/wildlife/leopard', keywords: ['豹', '花豹', '爬树'] },
            { title: '猎豹', url: '/wildlife/cheetah', keywords: ['猎豹', '速度', '120km'] },
            { title: '黑犀牛', url: '/wildlife/black-rhino', keywords: ['犀牛', '黑犀牛', '极危'] },
        ],
        hotels: [
            { title: 'Four Seasons Serengeti', url: '/hotels/four-seasons', keywords: ['four seasons', '四季', '奢华', '塞伦盖蒂'] },
            { title: 'Singita Sasakwa Lodge', url: '/hotels/singita-sasakwa', keywords: ['singita', '顶级', '奢华'] },
            { title: '&Beyond Ngorongoro Crater Lodge', url: '/hotels/crater-lodge', keywords: ['crater lodge', '火山口', '奢华'] },
        ],
        blogs: [
            { title: '北京夫妇的塞伦盖蒂5日梦想', url: '/blogs/beijing-couple-serengeti-5day-dream', keywords: ['北京', '夫妇', '5天', '真实游记'] },
            { title: '登顶乞力马扎罗: 普通人也能征服5895米', url: '/blogs/kilimanjaro-summit-success-tips', keywords: ['乞力马扎罗', '登顶', '5895'] },
        ]
    };

    // 执行搜索
    const results = [];

    // 搜索套餐
    searchData.packages.forEach(item => {
        if (item.title.toLowerCase().includes(query) || item.keywords.some(k => k.includes(query))) {
            results.push({ ...item, type: '套餐', typeIcon: '📦' });
        }
    });

    // 搜索目的地
    searchData.destinations.forEach(item => {
        if (item.title.toLowerCase().includes(query) || item.keywords.some(k => k.includes(query))) {
            results.push({ ...item, type: '目的地', typeIcon: '🏞️' });
        }
    });

    // 搜索野生动物
    searchData.wildlife.forEach(item => {
        if (item.title.toLowerCase().includes(query) || item.keywords.some(k => k.includes(query))) {
            results.push({ ...item, type: '野生动物', typeIcon: '🦁' });
        }
    });

    // 搜索酒店
    searchData.hotels.forEach(item => {
        if (item.title.toLowerCase().includes(query) || item.keywords.some(k => k.includes(query))) {
            results.push({ ...item, type: '酒店', typeIcon: '🏨' });
        }
    });

    // 搜索游记
    searchData.blogs.forEach(item => {
        if (item.title.toLowerCase().includes(query) || item.keywords.some(k => k.includes(query))) {
            results.push({ ...item, type: '游记', typeIcon: '📝' });
        }
    });

    // 显示搜索结果
    showSearchResults(query, results);
}

function showSearchResults(query, results) {
    // 创建搜索结果模态框
    const modal = document.createElement('div');
    modal.className = 'search-modal';

    let resultsHTML = '';

    if (results.length === 0) {
        resultsHTML = `
            <div class="search-no-results">
                <p>未找到与 "${query}" 相关的结果</p>
                <p class="search-tips">💡 提示: 尝试使用更简单的关键词,如"塞伦盖蒂"、"狮子"、"蜜月"等</p>
            </div>
        `;
    } else {
        resultsHTML = `
            <div class="search-results-count">找到 ${results.length} 个结果</div>
            <ul class="search-results-list">
                ${results.map(item => `
                    <li class="search-result-item">
                        <a href="${item.url}" class="search-result-link">
                            <span class="result-type">${item.typeIcon} ${item.type}</span>
                            <span class="result-title">${item.title}</span>
                        </a>
                    </li>
                `).join('')}
            </ul>
        `;
    }

    modal.innerHTML = `
        <div class="search-modal-content">
            <div class="search-modal-header">
                <h2>🔍 搜索结果: "${query}"</h2>
                <button class="close-modal" onclick="this.closest('.search-modal').remove()">✕</button>
            </div>
            <div class="search-modal-body">
                ${resultsHTML}
            </div>
        </div>
    `;

    document.body.appendChild(modal);

    // 点击模态框外部关闭
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            modal.remove();
        }
    });
}

// 添加搜索模态框样式
const searchStyle = document.createElement('style');
searchStyle.textContent = `
    .search-modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);
        z-index: 2000;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .search-modal-content {
        background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 8px;
        max-width: 700px;
        width: 90%;
        max-height: 80vh;
        overflow-y: auto;
        animation: modalSlideIn 0.3s ease;
    }

    @keyframes modalSlideIn {
        from {
            transform: translateY(-50px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .search-modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        border-bottom: 1px solid #30363d;
    }

    .search-modal-header h2 {
        color: #ff7b72;
        margin: 0;
        font-size: 18px;
    }

    .close-modal {
        background: none;
        border: none;
        color: #8b949e;
        font-size: 24px;
        cursor: pointer;
        padding: 0;
        width: 30px;
        height: 30px;
    }

    .close-modal:hover {
        color: #fff;
    }

    .search-modal-body {
        padding: 20px;
    }

    .search-results-count {
        color: #8b949e;
        font-size: 13px;
        margin-bottom: 15px;
    }

    .search-results-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .search-result-item {
        margin-bottom: 10px;
    }

    .search-result-link {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px;
        background-color: #21262d;
        border: 1px solid #30363d;
        border-radius: 4px;
        text-decoration: none;
        transition: all 0.2s ease;
    }

    .search-result-link:hover {
        background-color: #30363d;
        border-color: #58a6ff;
    }

    .result-type {
        color: #ffa657;
        font-size: 12px;
        white-space: nowrap;
    }

    .result-title {
        color: #c9d1d9;
        font-size: 13px;
    }

    .search-no-results {
        text-align: center;
        padding: 40px 20px;
    }

    .search-no-results p {
        color: #8b949e;
        margin-bottom: 10px;
    }

    .search-tips {
        color: #ffa657 !important;
        font-size: 12px;
    }

    @media (max-width: 768px) {
        .search-modal-content {
            max-height: 90vh;
        }

        .search-result-link {
            flex-direction: column;
            align-items: flex-start;
        }
    }
`;
document.head.appendChild(searchStyle);