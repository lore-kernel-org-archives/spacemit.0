Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B77C2D131A
	for <spacemit@lists.linux.dev>; Fri, 30 Jan 2026 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740055; cv=none; b=KjKMkw8vBCTstKOR18NfxbWpS1PdOM/XUgGcw6bKail8MSbguMgDRrdf4liMXjIuepAt95FhLyu7fMBFwWeqItvBX06tn8zHq1i9trVMG/o67/ONXyDI5GE1GntxmBjjscub67T3A0PIVS8R67qlpfbBTqLfA7JY7x6WETM4I+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740055; c=relaxed/simple;
	bh=RbmYS+GbmO5r9aIsVbkZb99LO5fpXfIwGvbgj9g6qUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9Qr4V/6/H6xSZjZB6WPiq2ZhMfVpF7BSF1UBlUSlFh/Q2O6/ZzSRNssQb2BAMI2WrIpfUa7L9mFMFI6GyjbekvixZYhHcXbwcVRBlgyhEdqFMF4h2O4J50KVPQ4AMhfKxApHYzlphZ0M851JEHOEhcm9L3zi8j40PWWwkX1khI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frQcX8eu; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frQcX8eu"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b7c5db431cso995484eec.1
        for <spacemit@lists.linux.dev>; Thu, 29 Jan 2026 18:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769740053; x=1770344853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=frQcX8euH6mZOwJ8pTZ695Ti6q0UmHigCftfpLHFFsorQWF7UywADB44td6QVEbmKU
         CmoSPWD1uN+EFKyLNvfAf3NJwV87ITSBWoWtwIHZ4CoKZYhrD7AnT4F0Q/orxKnSVldp
         5NYsamSXvW0KGkKl1YTXOJaWcJ/apZYdUUJAzOg9lZxGud/LZbO4ymoKtDtU/A7nsSNx
         e3Wuik1e9LceCUVK2mYVd8CrOM2LODqHhj42AcI9Wfjbee5fWtxee8iKzhgjFDMX3lP1
         s6rA9VF/6hFLfAKrpQocmR1OAjgvaPfjaa4EU7JW2FwU/XN4NQOA9BdUg6sa6WBnVSL4
         1pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740053; x=1770344853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=k/WbfZM/IFasdNOvsFWkr2YMRm+uZkOproq4sF3m3Xp6wt0uQRrvPIAmRLyYIZU+eE
         a+oxsj1pdlFkskcB9d9x8lbsTCsJlUV3cnflGIQfakiZderujb2ZjW32EL9wOV6aFbv0
         PeJaskyWb/I7BJtVlvxDt39UyCWHPmQV3kaS6vbMDn1D+C8+/545Y6qPC06vO433IAEf
         oWAikd6YCWAx8GQncYCo8tiXsSdhEs6Z0Nzqs709OXjHwB0yJ+EPxaTzultwrB63UmAu
         cAvE8fxaIXuLMCJq+GLHc4GnM6gy/4p2eQ0MZfWf176NYt93oZ8YMr4has453njE5S42
         r1QA==
X-Forwarded-Encrypted: i=1; AJvYcCVFnoPFIoKiJ0N0jiC4IyZkrM4VC9KmjBO1glWksG72I49zWQzbKA5USUGUfQ+ERpY/LUNgYoUEJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKAKafmTlg94VQlxQdQXdNtk3vPqt7qmSxDiMGVtjWuBsL025s
	5RguIViD0lQoaVLZ+gIQRcXzf3sH8/8x03AsBO9dBHXme9W2kkXm6kiW
X-Gm-Gg: AZuq6aIFGJaNHNQAIIA9m0eG/cO+XsStRg1154vaq5HX4jnbDlS6VzdijHKQQUQDqPO
	geFZP4eYRgFmY8C7VR+iN9BUQj1tf9O6TlIuRsUg/yFoR+2FDqw333kxKvr7IQvcJYM91GmhGYK
	R2vHUypnab4oFvwI9Z+fdaM6JgBMeMtbt01456bccwJDNLyrWcBpwKqWYm3af+OWO/O93nPOpjN
	woaWn1dDbAWxt3gJ8YPtBlLTBMTEmHvfnl9my5G9NWbbWKMbKF5s20LYhwgLUmZ/cYn95Mm5arS
	EOgWd+3HZ12C7ES5B0+dGaWcZUYzDrw7oDnHRCWHEKqh4bUSoqXlk56uyLv/Qs4v2T+VhtwDMvl
	T6Isv/0WOO8ggsU8NOx18E0GbD3ufWsXZqb/w1Q+B/el10TwjRJWLte1K1DnZfW1SKKJtWdZBAn
	4s33ey0c9sww==
X-Received: by 2002:a05:7301:3e18:b0:2b7:4118:88aa with SMTP id 5a478bee46e88-2b7c890c90emr706190eec.35.1769740053090;
        Thu, 29 Jan 2026 18:27:33 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm9365628eec.6.2026.01.29.18.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 30 Jan 2026 10:27:03 +0800
Message-ID: <20260130022705.1059214-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0

