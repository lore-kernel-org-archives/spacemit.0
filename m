Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975843FD01
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850365; cv=none; b=kN3fpGpuTQAJohIKhMjK6NyRo98lgPLb0SAPJwoVNxcV703S3Q4stHea9GnK4gUTp3HztcOp1ND5HFPU4rXkh5dCqt+vYC6puuaaD+ar6qPhpr8nJgoNXEYOGi4NsfmiKfYUih7559S2BfTqlsQw8LGii72Q36PlKRdx9c0lBHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850365; c=relaxed/simple;
	bh=Q5OzRrFfKB7ZEg61vspKHHA9bBG3TB7iUl10MdO8dmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKeWipIF/iZ9kzDR+RYgNJC9LsqyNsMgXAJBddxQEIi1zVz0Zqr/IOM28L1nQiA2dRvXzUH4GvN+AC4EtODYAEtZP7z/BTfFSXFWzlO5IvYg0zikd7kDBZJcK4Z29OxKizwhQXYFuNtiHrwXhvQasa9c2AueI0/Mu4CLuSY6fnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzpuIP5j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzpuIP5j"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19447355e9.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850362; x=1786455162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=SzpuIP5jbq3c3Ge9wRCr1T4P6mu4Bq2dyZVXqli4hwLmJX4LMtXoJo2asV3KNBUkYa
         eNGOvGuVlkGGuvckriOXLjCGAHvvWtzQ0RfrcW4ElSJYD2y665gjFQRGB5PIikfDkbPs
         Qcsmb/djlMsnXoOkhOeX1wpLkPv0Ioy/0g52HwimsVg8Z4Bycnf4sXTA5YeF55KG3oX8
         Iyu9PTyHSCaqaJfWgt5cjvxfNBaXbbw0PhBg/ucp0/8POEqFFgDcJaYUM1gMri9Uiy0J
         qb/c3bHyqOgCdqb/ZG8lasvbj2+U7xDX8C58ZjIGechfnfkiF+u8G/oWH+8gHb1c9pj0
         s3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850362; x=1786455162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=GFJ0JxfKO2wTp/+xr8b+Y8ZyJ7Wieh37T2b+m5/LRNQQt8hYhXUlXLh2szpscL6Gcq
         UYW0sW16/rjtRpehXTi3AuLpIhSG0DwupAdAghFPhQ0PCyXDKXw58uv4ILbfREvHlgy/
         ut5yk3UBVcmfFhwsAhcGybmWRH79Y1c7DQhSRBlX5sPSKXBPNuCwo4jYrQlnj6y5telR
         FSQQwwHeKc3SD3SSBPCix5RHSWOyBThu0KAF1jAItGu6BXTgwhMu48O5kpN8vi5BRWeI
         XbFCuLO72l2UZ+5w/J0k5G8om9NTWyIK3BvjSXi5TT9pbXlvrblEzThBeh47uQXyqCHQ
         LCFA==
X-Forwarded-Encrypted: i=1; AHgh+RomPVS7qYFwnLnXIkhvJBmyuM5v8GhwqZ8G2kLIL4vHEVs/OtOEjZoZ4C1zXaoDV7G74Z1f1V5mfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrb4M529JkUY2KT2TKTQ9kbCXs6U5VYW8MNutMiUCPfdK0n3Hp
	X1p7G/9vcUXVuKJ64FgxwfXFnHeu3X5XMZGLRxiNcOhzAKmAORHTE5CK
X-Gm-Gg: AR+sD10Xps4DlDpK/YCUjQIHfWO0u+/ri0DbmqaOcVnYt+IjPvV8s3Wsx1qK36BRZOo
	xRSO6Lw46L9R+WtRZagO9o1SnpTXdEo/SfVDkV+YMrOU9//YPRT0KAs+ef0mkJ872HF9hYEzghf
	Xwh5tkg7COCZ7hxasrqlQHJ13Q9az2JcsAbJnWjqGkDAeRQEGQawM8qQMg6m84oL8t65SBkLq2/
	uSRCz2IwxBqBLVtpdsinRc1p8Gb0OJ66+SG7g4sE52Zvw8/S1HQ4VJRhtP2AA4utQbcl7NnHqfz
	Fu0dsGdQczIiMxKZ2UAY1pbnrDfDWg/U6mDbuPO6PpfNziG4kLcuDwo2nQ4CQmJBngrSh8CjFJt
	8qjvhgCt/pJnvtdvHPCxEosgq/Hb0nqlQ9GA+tYgktp/Vdp0RtLTBV4jft2v4AC9lv6w5UCW0sl
	j2N9yXz3G1MknmgXsA58kNcdzvg4mS9z2lZ5ou7xUsrP+kLwGPlI9sDOOKHvc3SmcHZFv7XkYBQ
	etfLpl+iNFCgoWCMWvMrWYy/xvPMlY=
X-Received: by 2002:a05:600c:3550:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-4980c679513mr335803925e9.17.1785850361445;
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Vincent Legoll <vincent.legoll@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:33 +0200
Message-ID: <20260804133236.205668-3-a.heider@gmail.com>
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

From: Vincent Legoll <vincent.legoll@gmail.com>

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..dc6836ff7f1c 100644
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
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+       cpu-supply = <&buck1_0v9>;
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
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0

