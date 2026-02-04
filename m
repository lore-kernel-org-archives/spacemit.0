Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6B27B4FA
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211408; cv=none; b=MxOa7NiAzy9TDz8TQHEiwRPidR9Db27401xzsSV3jM+VLs1HgaBp/zxwMKcbGcHdINDxn0M6PgEFpISf9woY3q/bbmyDgvbD1CDIkDI+gtbKjGUAuyfMQhuUXzSdtZ8s7VSYuLGv1sBJeBfwsadxb/uuBCuvlJw3qN7RXRhfRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211408; c=relaxed/simple;
	bh=dYfxs2Td9g+O14L9nwSe0vjJoQdhEaPE7BaxFIJccJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3J8KlfT/L9oZ4+MXft2dKPmFFrmMaDgbgUeQVOWi343dYMC1ty+e6ob4sXn2/72UrykTzTMJEcMpOJWg/cTW1sYjhhBmtL17JR4RBU0cddMSOQj+oIiQnTIzxjCfDgKN9dFNYbyTV+ZUOtw/fd5JSnMgastfokFPaHauMrtsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sZqxGEln; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sZqxGEln"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-126ea4e9694so6151465c88.1
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 05:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211407; x=1770816207; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5psyRp1huVkUGw/d5LRBcHs9VkHziv5lBIU7n3+Lhk=;
        b=sZqxGElnKomtZmZP8JvOWxoJgwwg4hiEEaARyJtqzo3aesSfIym/fbnkU2YkBYYpHj
         krNHnhH1jCgE33UVSyG/VwjyPPSOW89MxB8a/NWm9zo7wy4Zfw+AHh5RqS/Dsocef7Qe
         QwApZzbT2LEzjEHwvrAxiG7k6ntiRzLNNBbNYJKKIwX+jFSKTUvVvTE0HtF7/rfJFwIb
         6pi/Z+hNyKiKRhUziPS+pJfWjyMo+gaQj2wlYBt8NT5Bqspm2owa0cLZ7iBoeQxkXjjs
         hi8+4HBInqa0WZOaTAmk2bew4Rvl/k2YApzqLt2ySiF7/SBVmKqHjIxVZ7YkmV2Aej4x
         pKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211407; x=1770816207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5psyRp1huVkUGw/d5LRBcHs9VkHziv5lBIU7n3+Lhk=;
        b=i1KqW179PySwWB8RRLfBP7Z2oB283OQBWhprHbJabO3n11JqFKOPZkrQBBHUpC/y6T
         XCSEP74ppkDPVStFBTo3zTDAp5HsqGcHu3ZTlaNIVgi8piVxN2PPR/uFq4Wf42Q3Bgq4
         PiOz3NLto1bbp2Bd2aWMFbvIyiByYEKKBZbyJsm4eK4H9o0W3ChYvbiuV6u/F0kBAusB
         YsWrte0WZzRGrafkB9CsKcgXpMxEAixCaSrwc63D2ClUiqIBiTtjDiDKbd6IJYHANL5K
         rnyYkxOpEtu97JnwpEjRA/jtFcILgtbn/p9ygNLEjSN+mDnzradp5JMhKSvRQiTZxGPi
         alxw==
X-Forwarded-Encrypted: i=1; AJvYcCXBi5Ue4dK2ZBSY3udOgmSZtS1HPUW7jVVDj10RxynErp+jtcBo84EYMhZKU47+jvAZ9pgiotg7Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYDoZ/IjNKOxvgxU4SiiDw7Kw4fCRCjsicTBRY9FrPSSIFj/y5
	JpDlKShV+9hFl9HC4SOdKGk1EM8HGidgh16bOd/zlcNgBYIBpAZM4W7PvOtsZs1Op34=
X-Gm-Gg: AZuq6aLgvG/mNUyP+s73MIiWPD0xTZNZUPybJto9xcxPVwECpWOK5N/64cehuOalhr8
	HJ7NWEJVAMQdZkZ9zXDytwVs75HWatohz4Z4DmeaYqaU4RkGIs+NlqiIF+rdM5EWwyq0FTyjUE5
	u5U+MXz3lGC7+hYvGtDwfkxYr0CzTYjhKaoYzRNGCFHIXeQT4elJMh+1/FXm41nM/lNog5kdam3
	r0w+XHSS7wUCr1csNVYgpM3vf4/zqW3mPD3VbPrZxmMNl6/P9UnlkDFLZ4YQ+FueQsnpQ53iSnv
	aRxzTT/p/teMn0V2sAoidgI+Tu+EOICAGFlVpxbgxE7W3sYTi4JsVH4no6pjbKe52VTkOpvpABn
	7HFD1iTVNm8P8s/TEno6wPoWE7iOi8UlL6Mao5FoZtwqoWMHADsQmz1VLphWLz+ohS0W4K7M3uY
	5iNblwkDBmoqz8xgI7aQy+pjcwpFXXdOQ=
X-Received: by 2002:a05:7300:dc86:b0:2b7:1d54:87e5 with SMTP id 5a478bee46e88-2b83299949fmr1330156eec.13.1770211407258;
        Wed, 04 Feb 2026 05:23:27 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:03 +0800
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-spacemit-p1-v3-3-a894b3057026@riscstar.com>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
In-Reply-To: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

Use per-regulator supply names in pmic "spacemit,p1" node to specify
each board's power tree topology and match the updated dt-binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No code change. Updated commit message to be more precise.
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..444c3b1e6f44 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -190,7 +190,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -221,7 +229,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 800a112d5d70..e2702a781734 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -100,7 +100,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -131,7 +139,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

-- 
2.43.0

