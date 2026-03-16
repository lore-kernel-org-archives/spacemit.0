Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3321CFEF
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 01:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622869; cv=none; b=aBGk6oG2Ka3HRw6F7/Ih226iwTsHZUXi6AKPjk+6QuL8MX26GsCULMwCm8gMCQKisTxtqyVNcE79ByUFysEztdKz/l8cS1SKsJoNEaktNAaoICU0t0AP+90zGp82I9ZGAIU5CBSlOo1+3dw9aZP4quUrl5KLqQ5mjD/wAwhsa5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622869; c=relaxed/simple;
	bh=oXR7vTLd0I1RsCDRTzJ+Auh0cCkgfICbXcBBqdH8Z5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNjH4KBzha1E//kfEN8j/2lC9d8cGirR+kRbti9fmTDgKIqdrthAmwoV+ZzI1Yfp5Ds2keR0c/4WPnUElZAHz3nPj191obUc4CpfCA+499AZ5LXtOjrvIMFm7CNf0sZkBz8JIKtu9IWSzZt5sfaTnf2IYQcyeR9llVAV0rBvVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jslYgwM5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jslYgwM5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae4816912so26279425ad.2
        for <spacemit@lists.linux.dev>; Sun, 15 Mar 2026 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622868; x=1774227668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=jslYgwM5AOTdrTGnuuuJD4qCX2/F8SJSCkqT8TDBniFeuYgc1FvmxptgzEAthp57RI
         09DEcKnC8duuGaRT4lxUr+CnblSsL/rHRT0QiNongPYf+gypmvPpcZgnB4aZydM6Yb5n
         U6ddfs1aqhIhtMO6qxIQdOBtpQkisBDf5clZgTOz5hD466eukpzBj/epv9HAeq3HDpJm
         yMtyfArk4271rcY6zy41TYzga2N1ZVL3O1i+5HoA1LYaSLiggEwUOlQwZLKDY3fHf7na
         fAHUVGBuXSbmFckgcWPGMInmqxel7PB8SxXy6iQkK1XdgEygU9onCLMPdPYAB8qemw1Q
         BILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622868; x=1774227668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=K4M1ZHoBegHf+x4OVwVRqUi1/XuL2b605zaj1V/vQXfyZUE+9LncyuFVQMNQq1aI5e
         dWzFkBxEswlmnp4GGv240Nw7f5pa6EG9rJ4isHSXnww7DNNKLsjrNby8/BuvBNcVM3xD
         TNdTCKf/wyx3n7Qj4rQdRquRino2o/b1v8Xqs70WKDWQz/F+DSAZg4vw76AY6NfWgJ2h
         A1A3Vw7y8ajSEt5geaBtGqtKiVH3JNlIbZraYkcMCo0YwSbnCra040QBw0BNPOF4w8hD
         QL5Rzi7s+darsc+kq45RGRoubLhxsOlAEQxPicQMG8DqbdKYSBbcl+uAt/pfLQXcOwt3
         +JuA==
X-Forwarded-Encrypted: i=1; AJvYcCWv6wCkosBzFfy+JHtBchw5RJxqsok5SNEzG3kKKcm6PW8h+J2Hw++hWAd17Z2XJFvcHTZ7E+ZMTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw50j2uLQTupEGRVgBoRRFLGwag1WPFaqbPzG9HG3DmrPkepQLj
	KYfHfXRKq66SEUmGOqsBTCa/dDoUZmJfCksUpXQMVlERFeSlef78Agwe
X-Gm-Gg: ATEYQzzuv4bjLhgqF80gPLWw39oAClCZWuybRGLsz3Jn72lx1fwJfQx1zcCKqmvCDaM
	Ux6GXxwE4IqvOV6N58b0V+eqaNFC9ttJ5v7xejuT1xRhcL3WSAnVHz9K8uT//iauEp1UwaxOM80
	M5hLy7f/UkyGdGNguq1rLb7Hp8WEzpxOsh4oFqhe/nF8fqrbMfWmEKNRbhvJZDBotjjmCbRs6Re
	F4bcU+uk/duv3Y7IL++sPO6IKYv5Q9YsD5ECfVlJWYthFRp68a9YGRgYZEgaGf0Sh7gJoeU9kYY
	FejhDoDKEJ7qJenlwZZ5c8xWmAXk7V0TljMBbg/OjCSHAdHrfOcKbezuZn1kUpMb9F3b8KbpaXX
	GGqiHtClwqnT2VMCJRyyRVS/zh0PGFeXif0ZF3A9djQqa7QpvbXBVGduFIqQ9QDon9PPQSRvX5t
	K78R/YYiZOkCS+8NakD2oeOvdafYB5r7p45w==
X-Received: by 2002:a17:903:b8f:b0:2ae:4fc7:8053 with SMTP id d9443c01a7336-2aecac6c131mr104368395ad.46.1773622867648;
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece839dffsm89559855ad.78.2026.03.15.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Mon, 16 Mar 2026 09:00:38 +0800
Message-ID: <20260316010041.164360-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
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
2.53.0

