// 套餐对比功能
let compareList = [];

// 添加到对比列表
function addToCompare(packageTitle) {
    if (compareList.length >= 3) {
        alert('最多只能对比3个套餐');
        return;
    }

    if (compareList.includes(packageTitle)) {
        alert('该套餐已在对比列表中');
        return;
    }

    compareList.push(packageTitle);
    updateCompareButton();
    showNotification(`已添加 "${packageTitle}" 到对比列表`);
}

// 从对比列表移除
function removeFromCompare(packageTitle) {
    compareList = compareList.filter(item => item !== packageTitle);
    updateCompareButton();
    if (compareList.length > 0) {
        showCompareModal();
    }
}

// 更新对比按钮状态
function updateCompareButton() {
    const compareBtn = document.querySelector('.compare-float-btn');
    if (!compareBtn) {
        createCompareButton();
        return;
    }

    if (compareList.length > 0) {
        compareBtn.style.display = 'block';
        compareBtn.innerHTML = `🔄 对比 (${compareList.length})`;
    } else {
        compareBtn.style.display = 'none';
    }
}

// 创建浮动对比按钮
function createCompareButton() {
    const btn = document.createElement('button');
    btn.className = 'compare-float-btn';
    btn.style.display = 'none';
    btn.innerHTML = `🔄 对比 (0)`;
    btn.onclick = showCompareModal;
    document.body.appendChild(btn);
}

// 显示对比弹窗
function showCompareModal() {
    if (compareList.length === 0) {
        alert('请先选择要对比的套餐');
        return;
    }

    // 创建模态框
    const modal = document.createElement('div');
    modal.className = 'compare-modal';
    modal.innerHTML = `
        <div class="compare-modal-content">
            <div class="compare-modal-header">
                <h2>🔄 套餐对比</h2>
                <button class="close-modal" onclick="this.closest('.compare-modal').remove()">✕</button>
            </div>
            <div class="compare-modal-body">
                <table class="compare-table">
                    <thead>
                        <tr>
                            <th>对比项目</th>
                            ${compareList.map(pkg => `<th>${pkg}</th>`).join('')}
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>价格</td>
                            ${compareList.map(() => `<td>$2,800 起</td>`).join('')}
                        </tr>
                        <tr>
                            <td>天数</td>
                            ${compareList.map(() => `<td>5天4晚</td>`).join('')}
                        </tr>
                        <tr>
                            <td>适合人群</td>
                            ${compareList.map(() => `<td>首次Safari / 情侣</td>`).join('')}
                        </tr>
                        <tr>
                            <td>包含景点</td>
                            ${compareList.map(() => `<td>塞伦盖蒂 / 恩戈罗恩戈罗</td>`).join('')}
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="compare-modal-footer">
                <button class="btn-clear" onclick="clearCompare()">清空对比</button>
                <button class="btn-consult" onclick="consultPackages()">咨询这些套餐</button>
            </div>
        </div>
    `;

    document.body.appendChild(modal);
}

// 清空对比列表
function clearCompare() {
    compareList = [];
    updateCompareButton();
    document.querySelector('.compare-modal')?.remove();
}

// 咨询选中的套餐
function consultPackages() {
    const contactUrl = '{{ site.baseurl }}/contact/?packages=' + compareList.join(',');
    window.location.href = contactUrl;
}

// 显示通知
function showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'compare-notification';
    notification.innerHTML = `
        <div class="notification-content">
            <span>${message}</span>
            <button class="close-notification" onclick="this.closest('.compare-notification').remove()">✕</button>
        </div>
    `;
    document.body.appendChild(notification);

    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// 添加样式
const compareStyle = document.createElement('style');
compareStyle.textContent = `
    .compare-float-btn {
        position: fixed;
        bottom: 30px;
        right: 30px;
        background-color: #238636;
        color: #fff;
        border: none;
        padding: 15px 25px;
        border-radius: 50px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        z-index: 1000;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        transition: transform 0.2s ease;
    }

    .compare-float-btn:hover {
        transform: scale(1.05);
    }

    .compare-modal {
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

    .compare-modal-content {
        background-color: #161b22;
        border: 1px solid #30363d;
        border-radius: 8px;
        max-width: 90%;
        max-height: 90vh;
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

    .compare-modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        border-bottom: 1px solid #30363d;
    }

    .compare-modal-header h2 {
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

    .compare-modal-body {
        padding: 20px;
    }

    .compare-table {
        width: 100%;
        border-collapse: collapse;
    }

    .compare-table th,
    .compare-table td {
        padding: 12px;
        border: 1px solid #30363d;
        text-align: left;
    }

    .compare-table th {
        background-color: #21262d;
        color: #ff7b72;
        font-weight: bold;
    }

    .compare-table td:first-child {
        color: #8b949e;
        font-weight: bold;
        width: 150px;
    }

    .compare-modal-footer {
        display: flex;
        gap: 15px;
        padding: 20px;
        border-top: 1px solid #30363d;
    }

    .btn-clear,
    .btn-consult {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
    }

    .btn-clear {
        background-color: #21262d;
        color: #8b949e;
        border: 1px solid #30363d;
    }

    .btn-consult {
        background-color: #238636;
        color: #fff;
    }

    .compare-notification {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #238636;
        color: #fff;
        padding: 15px 20px;
        border-radius: 6px;
        z-index: 1000;
        animation: slideIn 0.3s ease;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        max-width: 400px;
    }

    .notification-content {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 15px;
    }

    .close-notification {
        background: none;
        border: none;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        padding: 0;
        width: 20px;
        height: 20px;
    }

    @keyframes slideIn {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    @media (max-width: 768px) {
        .compare-table {
            font-size: 12px;
        }

        .compare-table th,
        .compare-table td {
            padding: 8px;
        }

        .compare-modal-footer {
            flex-direction: column;
        }
    }
`;
document.head.appendChild(compareStyle);