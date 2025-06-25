Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31A2C17B3
	for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869696; cv=none; b=Y48S1zYWi8wKyN4VcNDB2BKKKUeBT+EerG4TYQAiY8EUWatKLj8bA36ikiE94pa/dNNAg/QYRbaxQOFEvVal2suhShf3g1wgNGHcViwLDaa/jOPRufLeiLWWvAkytU8juM69HFBeGceSDqUC8RQuRiGHlUm9cV7e+YwRlQlxbwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869696; c=relaxed/simple;
	bh=WGruvn+Gqs/wHzBEiTs0RVm377PpbfSqb1Lgjf4ooI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsppyE8LovcnIVMy/lSxmlPPa22iDVITTe3JhZDjjlPFe6rMYbfCua3sJmPg/BBGJk0wmMa5D97eywX68Lg7rf9wNBd3M8z+no5QxAigWouyfvVVa4xQ9h1QhQ5n5HOjGRJl+Hs/Yzl0j4719Qw97GtjRtEHCPvrInn0moeNXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vjKo/jPs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vjKo/jPs"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d098f7bd77so19199585a.0
        for <spacemit@lists.linux.dev>; Wed, 25 Jun 2025 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869694; x=1751474494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=vjKo/jPsAZB7vvd/SEEvtgGe/zP+pbJiPAqn4RdbEPKQVwAZEp+VYKsNsTAnSDAkjH
         6SMLQ4UtaRW8uLml9WjVlbmX0I1hN58YWm5mSq3RfcU8kt34qBp4zX1krxUA2TnvJWp4
         F9o/dt1RaLiDxPUa7x2udTeU5yzxwi923lEbwkRXo/EzPeUi5FTDLmyPPexvQz2+/imT
         8pX4rqCHU1uCO+3jT5ASHZWFwzlIFn54QyBEpiWqrPMsBUiamD5csw0NMsdaEf9BXvdV
         rk7x5LGqUKbHRVrcv+n8I/eIniu6cKqEoNpD5LMKZYv7ek9V9TXTzkVAgO4n5Ewqq1TA
         NLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869694; x=1751474494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=dqfb+/th4ApKEai0XqC8ZSgqrR+e00H2N09kZXaMCT5JMP3cUMhBKX3hjGSL2EmgCu
         dNDEYVxO9CnyKMu/o7K3sdc1K4EVKispeqKUIA0H/j+7Jcr7jAgeGl2TBhNr6iYDYn94
         tguzi36hDmRZ/Uwu6hnh7n8joxRhvzfR6XHgAVBs50NXX1xYOu3QjB36SkpCh3/yefpt
         edtBBHLQlg2l6orGPvWGJw59eqKz80VhvBmITfoEDkbotcLSTkt4KbSu864blpBtbRk3
         6MXbe45zC+ERJVlfkxRvDvXAmzeTYvgIgmBX7US6AJL8Ya0fmpGY6Xn6BIpFj9pas4CI
         EvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcBmtXRwqTciZe/cKc7VqzbJ7XRdtROrlhcmBOQ0jVhmIpOxnreRrm/6Y6SXkQe6Rr+U6kH7FCcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIjWs422b2BTw7fsgaYTd/i3Z0bCoc8qJfMT5I7/PQx0H4tbVh
	zBdbo5W8/Uzk9bi1YnB9UVaUWBvU/IPKyJkQ4GEFiIYaRuJGs5stG2Yg1c4/1WWjVMI=
X-Gm-Gg: ASbGncsZ3BAtL/xbLai99XmrOE0q7ROt5nAj3HsjrdBysy8CcBgUsLPzlKRj19XGo5D
	j3Hz0fw5vYXFsqH14R/67QwnTFVZn80b3kb/6T5NWmr5wOZSnV8JGVS5uXrYdccP0HxpBVOI1VL
	mlVMovFAZSuc4hHgpcrDPBBJhlS+Vi8mMLtjEXUfWNGLb8luSDXBJTodnU2TvTIBiwBmeSrCMmu
	UYD4LvpmBLbVuDZ+fWsCmxGsWZixtoM7Urli5hV5BPjM0O/B5mUvP8Xp0x+teKZiwFn/+uG7wX4
	8g9RPC/isCxQ1K4S2jyzp2a59KKoQ9UxxqCH05XfWZ/6cIrba9fyXSszOwhQezsmBqt03xaATR/
	AoU+pXkih9mMicbwhgOgn3U8q0r62610xHFA=
X-Google-Smtp-Source: AGHT+IEBC2FuiYFCeaShYjBDomZFTypEHYThHwPRfGEGQQlsuc51Pdbq0Cxqjxbh0A1N+hYJdQQ/fw==
X-Received: by 2002:a05:620a:1996:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d43bb7e163mr36774985a.4.1750869693713;
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: spacemit: define regulator constraints
Date: Wed, 25 Jun 2025 11:41:18 -0500
Message-ID: <20250625164119.1068842-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2

