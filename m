Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114444D6B3
	for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979629; cv=none; b=qJUlrtzKBlg2QdGUpNDynuuNnEZPlVSsIHyoRZMr/y7ct5YAJ9tMwL5l0zurPcO3yZIJt+pEvIhTvtW7oDS2nilzTHtsd607BJyNPaSc6oAsbpB2A15dqA2aOmQ6XFM4NMKqM1cCkRB59a0Xvdlvt/EGbB+jlMTVaUax0TFbE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979629; c=relaxed/simple;
	bh=RbmYS+GbmO5r9aIsVbkZb99LO5fpXfIwGvbgj9g6qUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxQAUFFVwojfSsjjPuiy2cmTPX8tfUxx+uHA4cHKSsTfGtR+7iQhkH+yokZDe9JGsxO6eTKkGOkbnLM/zsbAvxROzpFubvBu0xqQrz54NKNnHQY06Hk8JWWbAiNMlXGKxtPzZ+tkL8+RrYO8FHSdzniE1pwPLR1FuatOhEX3I4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN1daZ3p; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN1daZ3p"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12448c4d404so5215613c88.1
        for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979617; x=1769584417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=RN1daZ3p5j6uxPPHQ+8S3Af4Qh1xmMGStaJtBb1AdPVtM/CEGg1c52MJbXuG4oTuNx
         9aeMsGyMO5GOxuOtFJthpWkF0VmUt37NK6HxWV1KJNeCFcHCynX6C3ENx974LTmL18Zy
         fXdqNnh6IK9UmxlAdt8j1b+NINMpM48ZRotp+OKDcvRO8o8VT8V8RIOTYcw1arKvc+Ge
         xdO6lytUTBvhmibwtTnQaaNxBjsrRkDyWak+zG1C2qV7yYkLsSQJc64G8kzC/Iwb11wP
         XfOnQdw3/c1n/tvAjYprrEa0rlO6xw5YvCBLsa9o/k/PBkizw5ErjgxS2wrslok8Hu0V
         A2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979617; x=1769584417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=lllIbwqi+IT0seFbRURYgsHXkYq8UxCrjRksc4gwehcyRrdL/YGeO19PigwWQ7b/Oj
         cV+eDRuFCjapESxm/sS/UoEU32Zuci4EhFDJBgmAqzq1NQezXV1zwsf3nFTz+4KDnrdk
         9sN88tT+yOcs5qVCFDWnP0ForG2FYtvK63l5riyz9pzzULZ6LDgbINsfvF4TQ6m6S0qK
         MSCHBXY7qvmRnIlIltE5YKwJIAJ5HMuB3oOZ1FTM8L8rIc9hLyiJcfbpYmmbM1bL+oJS
         NIL50lZL2Z7ZXUOmjf3km1WK031yu/mUIQjts7nwcV5OcDr0gOMgrFeU9ZOPecXkV+6u
         Ydsg==
X-Forwarded-Encrypted: i=1; AJvYcCX3CtuMxUyMynhYv8AkMjKL6Q4+LNBPcrcNPQj6NweMnhLVvArapy451HvcA28XSYTLNxGrK6aSsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyR1Zp1fNoSIU27I0fBjxA41Yp8j51Babfo5GGMV4tHewRJa5T
	tzQCEUVQhm/YmPAGxjRJiWAknrawfYlWUEfetLAheBX2LHDKXixh6LuA
X-Gm-Gg: AZuq6aLo/HywTAWzIZ5UtH4tiz8QpoLOqSebkXriIMWHg9fkODimCdhTXu1euq/JSiY
	q/vpR1tY8cVVUs6UZI0U9wh/cqxrpcspTeTyJv04bbOtR9q8+M6wTCqq/+vAIXbK+hzebILYie6
	3HY0u6s7+jEsHwZmHOtdogzw22jdHJ/6KypafqI28UuH9jidYD8tOviEHJ6nZurntP6GHV+D+rQ
	Ox0DtYl+KEcwwCnJ+8yoHv2Ui0UU4a8+A5I5JKzvGYK+56AacU0AqrVLWaMRpzouunQaHAdQaLm
	8WJs+IKEgAcakgmbRbNNQI2UZAkscTlol4y0s0huJ+gvcP6knlf1O5cMslmtxHA9YrHm2ARC9sY
	k/LFCeAnfz+VrZDq79jpoCO03TgHkkiKiAL4SA3/2PI/eoidF/Hmc3MxQjQ6OAfE60GR7f1blcx
	qLXShgnae+xg==
X-Received: by 2002:a05:7022:914:b0:11b:a514:b64f with SMTP id a92af1059eb24-1246a966afdmr2812178c88.13.1768979616484;
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm22387219eec.32.2026.01.20.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
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
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v2 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 21 Jan 2026 15:13:10 +0800
Message-ID: <20260121071315.940130-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
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

