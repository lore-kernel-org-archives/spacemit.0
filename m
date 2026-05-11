Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF2367F4A
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497886; cv=none; b=a6D670il/bXl896olIyUCB6QBdSIUHZnVLvIQ4sOoJZLNmgrH0HpoZfm0dUqJ13bqWRoqFD6r757NB4ENSYFVmgeF7kMXILUHkY0/9dyMHVmC+TttDxFjqHqpCmY0j2GiII4/DmfbBgkKVfyr4NAUGuIvA9gAeL73LyRadIxbNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497886; c=relaxed/simple;
	bh=wf5+F3IJ7PHN/4gxwWfDTlalBjHbtHC1YY7hC84qZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qX60VIKKrAsK3diaxv3K5t5wb4hIo1tYs5a+9xn8qRXigebD7Rlcuf3L93k+Qwssa7ItwJNTO0Laa9QL2HGkqSsv84Icem3GKU9cA+Sc9gduOYYDi91GcDDZjcLzP/TfXXwQpoAxLwvkiOFawTBmrn8g5p+f+VnAHU0eiSxVmp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0CVta6o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0CVta6o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso48604345e9.0
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497884; x=1779102684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=A0CVta6oDF+bkHd3tSeeZ+LyP2qPwPh+Mx0KRiWjs4iPMNgdAa/u9gccC6p0c1zvIx
         WCnZ1150o2osrUBWg7m4UV9EJuU59RyiWYq4FkMIVtQvlf8m0Hn4AnSlywlEEKiCY3Ih
         Whwg9KYi685+SifVCUymFbDYku5w+wkmj4c9N4RnhFuXLLV9Wcuy2o8H4hcnDueR9RxD
         8OudDJz6Uo8xqRBJxR4b/z40Xq97YMxFnasqRMCb0cvU1AFGSo4rfJuR0LV0qQPLEtR+
         j/R8pfQp5PGXquZ/BEJiubZQCU6zQNxK/xvPZoX7QxyEh31RV/mDA28sAoYSarxYUweu
         LXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497884; x=1779102684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=LKfa9Itc790XyDsaDOIXdNPG72EKlEF1xsy9bLdvWBLz/S6cE48LY26RRdcwLlwZAR
         529QTWF32cKjpJ3m79Mnh6mHVBjzxGJVFApI0QEQI9g6g+OPOtL6h57EkWIOFuqrd8eI
         7gDwKtqv+c5xwLB7uZuKNPxC22QQShwrJTVkM8llsXpmyw054NW0ZRPj3qyPFkytIf0E
         iMCoupsV1e9/5+6dJH4tygJjz2Q4Zkj0jGR21GLRAlLCgayoKxQ0k0jclrTvkXDo/vHl
         RTHD6ovTGjpVlrbQmf7q16xJ05V1X+PMMaGqgsghkfBIlaSpWBodUiQTC7eW46PR/gyd
         aZ8A==
X-Forwarded-Encrypted: i=1; AFNElJ+dCQlx34rl+FfZQERr1R1n+b56GqgP/hdjsyth0CysC3XTQcnjIoUx1GOTHQiqiARLetGpqin8wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcvNMOCIzdslLwHF6JDudfWJAVMx/O/LaBmSXwlt89DtQvlzqw
	17YNlhnhcdXBZA/9tqa1o2dmtSfNmCpvJuRavlmU6ReBXAqQ968+edRR
X-Gm-Gg: Acq92OE5ApH/S0x52Xf0Th5wKtDb+6tJHLJkUOKtqZ03pE3Gz89plMN/4XK/p7eMZFy
	b55W6Qx0THlCbSMqvmFY6fLKJHGfD1tywiIr7lnSzIfsJavuPjrGGsljphmHegc65vfPVSQ7Ydg
	HmD7LNsZjYkQcw6Q4GGBZvBCUA9TZEdKzgrQK0yLFfcxURDMyAxx1sSD/NbRrIPjGnPYkL4rcgi
	fdr9AlrkMk86yTrthNrYhzv0I4sgwrRyUWhf1suHHru9txwcEcnrWUhsUh5jQcvc4vurSfvKB95
	1ktRqEpknHUAaS3pNgn30IhYrUZkeAYgt0CafXqniiEHso+ENdCPHsrvDHyG3zGWY04lND8epk2
	F9rjtE+yBCCh7mxlfOn8adovf0G5t2tT2vXi+aNHgRXF+KPs1WowpZqfhy6+KCqfgyM5WHBUSJi
	7j1aRlGWaTwgQdtc3KspVPPjz7R1WSQB/7bbBG5vldwWhwP0rvb1028ynRCuORB0LaynO0gp0cZ
	Pm1
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr251837475e9.2.1778497883359;
        Mon, 11 May 2026 04:11:23 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:22 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Mon, 11 May 2026 13:11:10 +0200
Message-ID: <20260511111116.1109643-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
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
index 79415d760f162..7ebace0e46edb 100644
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

