Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803D2F3C2E
	for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169884; cv=none; b=JMwrf6r3J0bRMNet08RX9l42rSCjnI4w7I4Vj75sqq/ioTs71iZ7CBu9RcOPe2++qYaBYxI0DLTPEM7gkA24U/2W8I6W4EM+vn68C20c2oBFU4NNj58A2+jahkGjDf08mLw7auGTuJvs3x/9cgC+UjOtq+HWTGQInNzo/1CMzDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169884; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHpOq+N2B5CxLGlW8JOk/K8VXmiN20a+XTKZmOD3GFS5Rx9uZbs0/AabAYY+1c1rKs/h+hq+Ku9joJfSKZ4ne62Ztw9+1QZTfEedjgF6dhUJHg4UE4lVVuoWzh4Q+M4A9CfBkOO1zR/UK0hB3j4lOIiTIQFuM2f9LV/btsB5gyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o6aEJUgB; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o6aEJUgB"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d95b08634fso83510485a.2
        for <spacemit@lists.linux.dev>; Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169881; x=1752774681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=o6aEJUgBqv2O/iFS+pO9rHp6ZPq1Gm09e4vZir1xrGrogkNiMqjdMaBOg/B02WlhaA
         ivoSO0R7E20iL7cEJ32tdgbvEjX6f78Pfn5cMLeg5WC8kBvs1CeVUpewbTdpF+xmaAmt
         8MeCO7iVA3ZVfq4+v+yQNI7TPCIp2n/QZ+LsDUhfhDDDycrwcYKUFB8i/Y08BjLC75wa
         7T+17aL/dpCQxpwMro52S9my2eQaqKP3QplVEl37PB0TjeNRkEOYFh15SSNwfND65JtU
         dmBCPAopX2jOmLcNJTRy9niOF8pMlqaNhS+5+tLUT8U3DNNndS/VmmW06AQhx44/tia5
         zwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169881; x=1752774681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=etUnLKzb8heMQ5SlvMEMJDQaF2TMxYCn/r4HtqhvoREKSLckvEpx9TV4x3xazIItLs
         wweciuAb3z9NT6iQQDEqYDiZ4yYOCZ96IVcf4SFS+89hOR95T+DtA1ud7ec5skbWS2pY
         siRowrRYaxpfg5kOOZseTxPtY6HjSt+Euo1DbEOdLed5kU51tpFjkZlwrgPyzOYmqkoE
         PcwqxudGOocyiVHUNQTZ3Dk5YoTSV3cZINyHyKtO31S9fZEA4ElP3KXqoLiM5JyEWyEL
         r3qFJUurHa7qTUIQSkULJkRAdDd9eArUbr3I7yGb5Q7okWyqvqneTfBAg/lO+gjHMsNm
         fiUg==
X-Forwarded-Encrypted: i=1; AJvYcCU7GNuTDt8x4O0paHnWeKEa10/7fSkygt2X9bTqVtmTCor+p/nByt+bCMCooKdTgELMKRc40ycQng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7vMKawRQAw3I96LkksUdtZDVBhFYLWFBRo2D+jtez1lSlMRgu
	FeMoFwd8wdYpDOy0VebrEW8Ni2YgxnCHBOTNHMV3Qb56RY/qgEt9quvpPETQuPeA49M=
X-Gm-Gg: ASbGncuCFtNujIkCWlsQCBLftbIL1fwWhns+fmJpy/rKO6aDeOeeMU9MNDommXslhdS
	I619c6VM7+jQaxwOOWEepyG5Xe/SyW5ZMlHAJpBRmdU862+gU1QV38AADBg+xR+Lx7vrdpm147j
	gOho5K9/pTHAJzIGEP3/g/Ys9VULf8l+U8l/zjHKPwVjGI8UuDKqCRzunGXXy4VF9h8ZQW4rnn+
	sPcYDjdKOdq4jAFYTMZAsI7yeRz/mJ7JHCv5at2GbE5aEl6zg6ecndlDKzJXYMrrfvd3s6ntwKS
	c/MZ+bdD6omkWd1Py9fWUaXab8J3CZVMAEtglWqGE6fxNF1sCHWkN3BKCnmvwqPYuVMcK2PicX5
	2DE+jPionktVqbO/9orM1BW4XEpAl65H1oFQ=
X-Google-Smtp-Source: AGHT+IHBaLoGy+mXI82bk9r9JVDCOAUDtCda2f1J3UcRVBL1tXN88/2gwPEvHSrFuX0VVuYTud0GuA==
X-Received: by 2002:ac8:4e07:0:b0:4a7:7b5c:90a5 with SMTP id d75a77b69052e-4a9fba23006mr2458881cf.7.1752169881236;
        Thu, 10 Jul 2025 10:51:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:20 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 10 Jul 2025 12:51:05 -0500
Message-ID: <20250710175107.1280221-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

