Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8DD352FAB
	for <spacemit@lists.linux.dev>; Tue, 20 Jan 2026 04:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768883792; cv=none; b=H/giBPQ2+4kxeMpX6UwdI0rpyvmoWNuOWYccEnu2T99zMzCkJsjOi2qB2XaQYY8cUc+Gix33n4cegBNCw7UA2ry5beOs49KD2LcrFAIBXFFnCrYMy4IoOLMn1lVfv5IBhC18FDeYLxuj8M1cViSbzBB/GrCkUQtftXLd/nIU75A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768883792; c=relaxed/simple;
	bh=RbmYS+GbmO5r9aIsVbkZb99LO5fpXfIwGvbgj9g6qUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4iaLI0JF5pJzaVuLLo+4Hxfnxn7Uac5/CM5esPtvt2t7XRvZyCrZQLWeR18tirOeKVlFMC1Avq+TdDeCigHu/JhFRZz5SP15EPc2xDYi8ptfSpPhhXrrQ9ISdMeyQwR7nHeaFPYqQIKhiZsTonohIANaRxZtyQE+Y6t7S+PSSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imt/Wh4g; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imt/Wh4g"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b1981ca515so5361520eec.1
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 20:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883790; x=1769488590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=imt/Wh4gLwT4X96XA1vENOmobxTF7Q0mstxJMM9LOWiQEyVyj7wAOATpe17rLfS1DN
         DhthQk+QOTAk2hy+pe60x9sDHiPlynaJaPR1VfpXSlP5Kd4ObPCzwmUcJ2stNtbhV7iO
         WWMTwh/mx9e33LU2WLqAfJAclZV+AbPOl+ZGJE4l4cQz0tIc0kwfmmSpxSzC79ixekR2
         F1+pfXa0aGjyIwjo4Jb6ShnfIy1xhDdmUKruLoUTI5+69PKKQSLRgKCDxqhQfUB+0/Oa
         N1IxBB9eVkZqHQJ3HvefHdwL/7ilCXLZh8H2bGMxUD//gul2McEhQIGkX7zfkcb3WTOH
         mkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883790; x=1769488590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=Kn3lgN/O/N93wgOy4rziDRNKmoEUEjXBy7BVInybvhS1FrxtqJO7RX069n2lAvXk5p
         lY7kP8lYNgQhxwLjSk7KMKvMSVMq+5HrB7IrnEmWyfvdSkPcMd9mrQuuWTfj7TFIcZPr
         JQZkNOKtSVW7/O7EOrSsB6Ad9DBWcxoTdjTEdYvu6tme5FzVbVMhJJ7dPt8zuLm10ZfP
         bXIEpYn99HRSqBfNOcYadFNbDDERlvV7E4H/v4+CIZcQeCuRPUGYvaAq9grFIuwFIp4G
         EFXBVYTaYWpbsLae2nK2WX/KTBJtHUaMkq6ug+2cuMEitltRQ5D/cLh3+nm17SeubJBt
         bn6g==
X-Forwarded-Encrypted: i=1; AJvYcCX1F/JwsObazeowU79Mv/zrywBMj3FoC2R6t0SycBCoIiG/UI9ALtRDcbGhA3tZs/iwkAk7Yv50aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyXgueN6D9ASwkPKFaRX4eyWUIp3g2hs+qqLNTtI6ZYsUn/tlY
	YfkImuZ3IFuDjo+JPeEk8J7tFiYCRKfsUuAZoFkRp+Ps/1hL6LHg4fXK
X-Gm-Gg: AZuq6aKK1KyffV7Y/W3/+afMuR0FkVpRcP5+K1kdgHa7N8Z9vraw3khaDuAs3DUltb2
	NtuwCUbHZVWXC8Kz5rFcy2fl3WppYWVV3zzVGduOhQZWoRaNP+QPxwl3jgehWLazqdewWcw57lY
	CCp+g/5WBCQADAcbqSn0O1b04TBOL5j16uGEp1sQJaKcEk4imoS5YxLD1JkVV/bQjIe06ahfiUR
	5cnLgpXgMU1ISeP2j4ltoFqcgYJ1CJHsUE6JM6kPCrJR8xw4G83z9aO6l2+7m8DLAfPIgov5N3G
	6veFZ5r5zpzz7dQqQ4uZ0UQMVzocaJ36jahOMLmQ7bfdQJfy/pVwB/8a6tAmd3kKelqSD1N8bKP
	WGVl8F5hCaRDkEpHev6K8yrgKhfwrdP9dW/aXDxhIb640U2k2VVsZ1/OWJnJHkiZwXbhAiU0zvV
	OGHizdMQWADPossVbYsomY
X-Received: by 2002:a05:7301:9f09:b0:2ae:5e93:b6d with SMTP id 5a478bee46e88-2b6fd7e55f9mr304430eec.38.1768883790053;
        Mon, 19 Jan 2026 20:36:30 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fc2820a2sm1030314eec.35.2026.01.19.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:29 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue, 20 Jan 2026 12:36:07 +0800
Message-ID: <20260120043609.910302-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
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

