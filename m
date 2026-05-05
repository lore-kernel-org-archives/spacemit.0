Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787B48B369
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997193; cv=none; b=NKozOLEceuGv06ry7/IR+s3yf/pIJf1ROaB79wWbhhWCCezui/y+mMV+By/ShnHYRZVivrKyD1Gzi7EyBPrZj0crmpciXnFn/A6yf3Lb+4APvNhuTHN96KT0QW7ER4AvblrI09PRMXPeHDSAoYhRoKhrIchPmpMj7wOoW6AhL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997193; c=relaxed/simple;
	bh=8NaqPaBb1Xsn/l72cI102luEopF9fq/jYD/XsjUz8RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Inq3zPqpCxShGvz5ptOlTr4gq4IEZqVfvx+0aDGrRSsNHw4HeIJVdyNodyavJsgmBu70CW0qOFcYqbc3+beLE3qPwba8oitdxi5chKExKjc5F+5zYDbsT3QBEv12JkUBGgBgke7d5FiJ9jNPdzVZh1/F9H7+u7JC9DX0ENGdoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdY7WEuD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdY7WEuD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1860558fso1665480f8f.0
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997190; x=1778601990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=CdY7WEuD6LkksmKkkWkz5cG9ABVksbs+ZwDQ+Kfsx23r5ZaiSe4kxEKiWd5mXtyJJe
         UvDnMRPpVsTsP96UpBbWqghqY4hdbFgLd7Y0qdNSQlWz5EfEKtCJ122dPVx7GInjAmIf
         BjvAOt/VU89gIrKZ57ZihumJdKt3hW3tOAmcyuiNAkWDUhi+c3uq8T3eIgrV5D1l1x2f
         TINUb681oKmsf1lawAbQyIKW1LGvKRftAtWxV79cGpmfmDbi3JGzwJuINPhI111zm0/0
         xku4H38+2yY/8rl0HUQjUMKMOHfijJEjLKUs6HwvxugjtRZFpMJRyL90MGN7NaddEa3m
         H2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997190; x=1778601990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJ541EuMVQQ1n/T8Bd5ppQrgaJbp2dn8HqZE862Y/v4=;
        b=H1Ibh+g+ayklXUNXsShFxmMhNFsPZsKCpmXQFVdeIaMpJrUHU9FffR62hbOoR7R4h2
         vDR7ySbp2vx6a9Ap+09r6dQzWrkjHqvI04j4pKHlTSiN9XZuGiG2wF/PGCJJwRrlllXU
         KRgCQGH5grD5GWuJGTzmOYkxmt8MRcK1PGjRF8j3l74aq/ZIeaUnMrdZyTeZkF1LYTAy
         ltpuxlzGzgmj1g8A4nrna2sSPdGeKqY3Xx2xn2u+Au/L2aRCU4kJZwD4ZtGzsNx9GEYR
         A2QtRGnOkDs8SzLgdaDJOdzRMJMARDPv/989ZsAY0RkUyFfO++Eqqe4a6SrZapXtlzMe
         UqxA==
X-Forwarded-Encrypted: i=1; AFNElJ/a86Xk1FCz1cpAx6t/JafLXlW2l4IsV5pH1aCXAlTZcSIyjeITZL0iT0tZwmcM3lttjxBns9HIIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YweGE7zr6HI9ADczDQh6QoZEekow91vEdDvrmJZfnGvSulV9GDn
	U1VvHZmO+3afp8Bytpyzlvc6szIjDj/igxzgqva4cM4rpoOnanOP1Ayl
X-Gm-Gg: AeBDietqvYnwybw43cSzxko17Ahjg/cUqKW0DQ5Nj7oAnvGmkeTTrqrFVHwmKg1YmR4
	0X3GwYKfoHzCCR96MZn71N2Ot5NGBnZbFV/kEFcSRphN2glmB2s0ogd/UBLPr+eU9r5MJVdqLgi
	ARQm6ioZdzGgsaQmWFuDGfGuSw+8pjYy7IJBng3g1YVmyY8oMG4uFXd8Ni4IH286s7apaxNHI32
	Hx2pnnenlVayW8LGK4eDq6SUz50NWqEfpyolEC1VZFLiRFEO4T6dej5P+nSGK14QXJNHoSbPEc5
	Z/rn8eOgq58DgKvhbWXt0fEw1t5G8bud8oiL3sn2kSBgaim/6lC5tMKjq+g7NZdoR3atJhCLYVt
	U2VuyEXb6S4JB0aQ/dH1Tc6tpGmjk6dAQgRBgjw1xbngH/R2YLeGIseqXdJsm91m+UlfIbfqXmH
	Tgf55nhO802LSgZkV5f7xLI1APbDJM6PHn0ecPN8SPUGAoJi5wvDF7CXqwKJsX2jabNkiyKiI9F
	AM5KnY=
X-Received: by 2002:a05:6000:2088:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-44bb586d065mr25568540f8f.27.1777997189628;
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:29 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Tue,  5 May 2026 18:06:17 +0200
Message-ID: <20260505160623.1369347-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 8bb85b5ba1943..32599082b3c36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -166,7 +166,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -249,6 +249,47 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0

