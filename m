Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F314611C4
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850366; cv=none; b=N6uB0fYsj2i1ZwHY7BouTGqeW5xBbT8zsYmedbWsjTXje2TtD9J0KqqsOiuqfHTgQHFukZEcwjmVkmAnv6Lh+rwQ5lA0PEBbkQPk/B9zaZIo5q/QjVJpNgbx029VHCJjiOQwTtg+O1C3Fn4IXDE3HGi6xZNZnWwtuvyl0gKQCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850366; c=relaxed/simple;
	bh=eRx+GT39DKzuTQx/btp7YCRJPxu30ptis70hz6RLU1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4lvUZCIx8OFbAiG9wH0qyHHAvfCq+sw8XQbaP21bsjGgkk8gxUWgiL1PUYqQ3gFobVEZR0aeQ6qcSjXV5Mmj4vvWoRogS8ac2i/AG/lOg0ekay3nsAX6CG9LUcMq5IeVoTOhLfsjC5zlTK9H9dg5C+XigqjfwOk1rjsShomdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/KSJ7GB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/KSJ7GB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so8700445e9.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850363; x=1786455163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=m/KSJ7GBbbaS1LdgwFBj8gM3xIMrFTIJNsKkXPiKn1+6SVgZ4+0cEOmD/6l+y3zUT3
         7TFGNhzK5/AGFdLBzOTIy8ualUfyRs4WHlBLxqbbzlgivVBtV+eBkoj7ay29a3ZqTy3I
         0yQKuJUN5spSPE+aTytUU/LceJrK7fQRx0tI9RsNLtKS3koWtqbcF8H9UBTTiXoOheNL
         llVaaHDa4A9gl61b/AnE2KlyBymdMAP5jku9Z5KkRYIus5UKG8XRzoK/E8SJnMkbI6qM
         VAOgFRpVK+bemeeJiHSlimflznmlefQu/OI9s6lapZiVPKs6IGBfYsCP6Xmr9KY1mLZh
         gFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850363; x=1786455163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=ISam+6uq1qbihc+cXodule06KD7T9PRKghuhlp6QDUlYmDejukmDRsIPMD9JKz6b5b
         17bKyUsdQFJwXOmG4jbHaxB39XKPtqLDojSjmTNm2H4oX3GlVIbyGnMrqiInmdLRwmOE
         4sNR2BwiUZu5y4Pm7ditl0PRYJQiXtNWi4B4q9tzNpD9GJoYEdEkyZGktyS38uz8q0p6
         UQtVIEiaPbCW7A6rAnqMCW0S4PjNpC2wPdypwyDwpxNCMXGNEtDMxsqtrXwK9RU4xoUQ
         w0Dod948n0D73/OJsmsgBwjLAbMDhYEGUsrfPdH1SkdQpTj7MLtqKSePsQKnk/NBcGq3
         2rGA==
X-Forwarded-Encrypted: i=1; AHgh+RothqHl8nA+1Y1jBYM6xqG09fJQaSFKSZ2ek3ZuWgNkAd7y5aD1o6xnhwmBV9+q6zV8HqjZeUSHuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/hr9iisG2wWZIHdE74+PKINFcMj49XFKqvGb7u+vuQhgBQMo/
	BFCrcAE9anSpR3mnZ61x5N8GslIHWEz4TJidN/A+g5YAiW1VaHdYNAHc
X-Gm-Gg: AR+sD12lgerp5YNnjuwuo28AQ+5ldzMT+1/kkicLF5n8fsY4aVf8RbaGuvGtQilGLi6
	swBwP1oCPP8hyKZAA1IGaL5yutdk2rHfleu+DQGIk7Ox9Hpf0ZaLPTOtkNu8kIncqvu1JIPwFEx
	PjVdr0s4SypOzqJyEHnLDM86NdmmdZIR5wAtrb1pmgVd7YiPUevo9fuEcE9OoA7DW2jkhUn4tyL
	Z4gTMCYUqKJFYJvcEgIa+td1dyIjB+IuyaczE88hUNFRWIz7DOO8CEcTsWWWpY23adc6bNNZ2rv
	v72NzwNu2Z9fVfOTEmIud+85BGRyagoJoDnJSssRrlorU0atvcchPRq7QV03+pZ5KqprSawLdZq
	Ad6V3WtkT7vRQs6EpJDhuViRofXnrKhpEUk0f5lN+RkACP0LXKEMxYOlRCHm2a9Cnt44/5MjSST
	BQjUkAaSg6IHU0hC3z5jK9XJUEWT/p+zSGlZY4dT7JWT2zQH8lV/d+6H/i4mNccMQ7zy/NXwNVc
	0WUQKY359lkanZ8ofzNNktM+6jZ/H8=
X-Received: by 2002:a05:600c:4f86:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4994a0fc5f1mr77242865e9.6.1785850362982;
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Jonatan Hazell <jonatanh@hotmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:34 +0200
Message-ID: <20260804133236.205668-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonatan Hazell <jonatanh@hotmail.com>

Enable CPU DVFS on OrangePi R2S by including the shared K1 OPP tables
and wiring the CPU cores to the P1 PMIC's buck1 rail.

This mirrors the existing cpu-scaling support for the Banana Pi BPI-F3
and OrangePi RV2. Tested on the R2S hardware.

Signed-off-by: Jonatan Hazell <jonatanh@hotmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb00e..6ebd4334410e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -50,6 +51,38 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
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
 &combo_phy {
 	status = "okay";
 };
@@ -132,7 +165,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

