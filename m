Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C738F934
	for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555679; cv=none; b=A1ft6xp+DNguvaF6VZrMNBrrhlAbfvWc0M+EA38/AY5U+c6KvSsVPNi0lPiqldh1ROaXIXQSTb6vJiwY+xKll980Afc2+8VIFtAHJEgLcohFR75K60WVRVM8+evR6Y+Q6p3N4XM6cudkTTaFkaOOolSKjmiKrD/D2pxkcfFjkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555679; c=relaxed/simple;
	bh=DtOWUCEOYn4g9JxT/PZO+XX7FO9qvojsnEYX7Sk1qCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wf9t5o9thS9hY46igIrrOXnpKIpKCVO7O0hFxutUZroFXmypp8CN0EkUqXpUOUsX+6k2MwFgGceSuOokrbzaefYC0RxCvaHO2HTxspTvZILvecCFiJ5MpBgq2A8JInnvia1fcu+xinjdTL8OpGNXQsKNgKtOqkn39kANDSWv6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTTil2qL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTTil2qL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cdae130cso18658425e9.0
        for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781555676; x=1782160476; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=CTTil2qL3gAJIRC83I2t8/GXq+imn8AOioNHAgKp/Nh6io769o9Wqp3NoB1lCDajh0
         PvK6OYBw7p8lWeALLi9ssHJMcHOpcMoJDU68iBFKw6uDIZNGzcBSPN4Cm2ZcYkFxxis8
         QtcRlF2JnUOY6sWZRPFgwdWPpwpUIjjHr7ODP8kk4u/Dv5d07r7BH/aOFvv0PE8+LAIb
         0hTaDkHBR2BvKaCWHDfbjEWfi+YXlfVaY6P4HkZc+k9QPZl2jKy85uRO1ulFeQvcCGAd
         tG5r5bK5ZG5zBGqULEiS0+paFsoX82VkEVowHMCddF168+wBroWpA5/aJ8UH3ZMO2kFT
         pnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555676; x=1782160476;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlEk+div6nGGh0ueIq6wYoXxweMlzOM7O4EcszKdFpY=;
        b=VKQ7ZCWaPwNzyd2RMeh4XKQcl2j50eAo8vurWs28XCX/443NQwt700WRAJz1qSVMSm
         RDUg3CfZJrKLVpKGGoLRFZqPcS5SFiAh9XbzUP4ZCDGPdO2MKDN/+SCU36Aq4Yz951Lw
         +nuwNj+nQ1QjYgGv0fYTPwS1MgOHp9ve+Aiho5fMzBJTJleF0KALlSNYNB6RZFKM1fJU
         jiJJj/QgB5LILxqICi+pE/VSeSO3tA6KuRM11Csvm0OPOqME03B0xnGZoGBPO1HTR1xf
         Gn1tswo7nzeeuOiNlUrnYAXDAK1YFhWHX6YwqFt8fXLFoRMI1UYFSoxrl9HwjWG/3HH8
         gXhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cFTBziTnvqdeSPa0sQHdASOTct51YNbRjHP/imYHOOP5juxOC1i4q3ZFEwvjMcyx/HaIexzujpg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrz1ICgUJcpyBa2vTNnscLXMxl7Y+xsVvAID8csDaTK+pmSeUr
	9QWCi8CwbP2sMhlS1FAaYKpX/P0sJKFxJhUfSFZouVVl/w6GISay57HIg3tB/YbQ
X-Gm-Gg: Acq92OFpyZhoWzYLvMnwsZgN7r3KnCiHMkyGi2sOi85cumo2fmKUIFKhdaQbET6rx5u
	UFc0AizJXqvH9ebwU31KVxzzR/cMjqQbPGaIkWi4O4XZmodpZRRybB3nx2KfPjxo/plc80Dl0b4
	J3415E2iJQF4/Phs6yBxql6UrJeqbZkeCOdcNCU8G5mrwfi310Rz9WQ+EKZ+kNDKeLfFtPnuoq1
	VBOUVfrmG1eIgWp52z2diGaK27yUHFR8Q/e6iOLQQ7NBeh/YCawalpXq9EyBJiEQM+HK57FnnDj
	UGzdZiFTydyQsxBW/KHxd7LUKuYDme6Z3z7aG3G2GUeSqG5egO8+9X/J7N+hQv3Uc/6y5+BG9Lq
	Ol99fsY37BJjGI7G6rSFtnitl+IaSIHybWY12vd+fWE7R8UWF5rwvFiqcR+I8amXRxyY5Wuiktw
	yAIo+gjfe2IM4kxOxDmLfpvaQ47GLX2DY6aPNIM9LT/ujRltkQ2rvg
X-Received: by 2002:a05:600c:4e0e:b0:492:2e1c:1d19 with SMTP id 5b1f17b1804b1-4922e1c1d3dmr48342575e9.31.1781555675807;
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
Received: from 10.0.0.2 (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922f9cd140sm18001655e9.0.2026.06.15.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:34:35 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Mon, 15 Jun 2026 22:34:34 +0200
Subject: [PATCH v2] riscv: dts: spacemit: k1-orangepi-rv2: Add cpu scaling
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQ6DIBAAv2I4dxtAIdpT/9F4QFgqbQMW1LQx/
 r1om/Q4m9nZXUjC6DCRU7GQiLNLLvgM/FAQ3St/RXAmM+GUSyqZgDsDPUw24hNC3ITBQZw5CNT
 Y1ILJUhuSt4eI1r328qX9cpq6G+pxy/2MXJnyyfGv9S6NIb73f2a2TYmlJUNWIpjGCqhYpaBrK
 IIqjVCSdrWh4hz8w3k82kjadV0/ViVhtdcAAAA=
X-Change-ID: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd
To: Shuwei Wu <shuwei.wu@mailbox.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vincent Legoll <vincent.legoll@gmail.com>
X-Mailer: b4 0.16-dev

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
Tested on a 2GB RAM OrangePi RV2 board, patch applied over
spacemit/for-next + Shuwei Wu's V3 series.

On Void linux (musl libc):

uname -a
Linux opirv2 7.1.0-rc1-00043-gb860bca13be4 #14 SMP PREEMPT Sat Jun 13 
11:02:13 CEST 2026 riscv64 GNU/Linux

awk --version | head -1
GNU Awk 5.3.2, API 4.0

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.300s
user    0m0.299s
sys     0m0.001s

echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.432s
user    0m0.429s
sys     0m0.004s

echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.476s
user    0m0.476s
sys     0m0.001s

echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.582s
user    0m0.581s
sys     0m0.001s

echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
real    0m0.778s
user    0m0.773s
sys     0m0.005s

Changes in v2:
- Fix indentation with TABs
Feedback from Yixun Lan (dlan)
- sort includes in alphabetical order
- use b4
- Link to v1: https://patch.msgid.link/f031e13e-d9f5-414a-b90e-a3d5a60b8d05@online.fr
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 35 +++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f3..2c2542e02d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -80,6 +81,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -162,7 +195,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

---
base-commit: 32cb211965ea0ba0ab8568959f006c7fa10e9f23
change-id: 20260615-k1-cpufreq-orangepi-rv2-5ece985163cd

Best regards,
--  
Vincent Legoll <vincent.legoll@gmail.com>

