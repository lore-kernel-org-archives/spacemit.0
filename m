Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57293A4F50
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 05:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635360; cv=none; b=hO+Nj5nONj9mbdNW4aIGMJRoruSvihYxuJP81QsfLT511flfAPXM5r7SNLXwEDAQHh2bT192k2CHN4UU0zGJfS7Tmx+yddWIy3SfXpl9mEBbxQTH9xDHJGFchtQqMtPBJxpA+7uJoCOxYQyy+MagkJOxv4n9pxLh4xqBCcTllDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635360; c=relaxed/simple;
	bh=RaTymEHSDV30L/LkCYiLFdOEpmf4xne6bHjijP7x0I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUiJPtwGbQ6OXJTFDkIS4WV8CFlKBma03Urh9WdcYsqgZUaQ5GDuQqSRzsok+PvQ+zyQORnqRsDXNLAYL02xmR8yMhh2eDLtiid7v/XxxuAFA2dn+0nSatbkuCC1ygLS+ndE8FTgkZ8PlgpaPzYCssrZSQKRUJZjPY60kuKTzKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIsyjcW0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIsyjcW0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so8484655a12.3
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 22:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635357; x=1788240157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X62f8JLureuRidSfKDfwTN0I14MXvczhJm1qCqBPeg8=;
        b=IIsyjcW0Y8D3leGYDf9/YoUt6PY3VGPwexJAroF8NpN+TIlAJYzUB/WXtERISwcmrW
         AALJs5L403l6pqha9ASv9hdn7vKlirD1+6Svpe3NLtiqE1yMqEZZZb+Uwo23qymkPdgB
         oTh0cmVsZZPV5SUsf7D3nEHl9c96D/+6QplfJO3fEY4aTcxYQhGyFlz+SXJ0YAZgjqRh
         poNzxg/tc6yoCs6VG0jbv340lU7oifLlec4NTeFN93F2xjWf0C9IoOpWz9Tp4MTZcylo
         Ld6eKqcIXZPPmBsCgJjhVSIyLU493E+PSgqRz+5ti2U8rpnPWQMa1aWPrbhCmVWRY1pR
         ZaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635357; x=1788240157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X62f8JLureuRidSfKDfwTN0I14MXvczhJm1qCqBPeg8=;
        b=DSvx5SgCI3K0tby3EFkI2UT/oXTuzfVn2J0i0hYLyIby95VTWXQtd+M7LI1wnW4pg+
         68GtC74ABUUUJP3dhHqM4fPLUo6bgFXoqVJxwci0tXUlGkhIvxtP/5QOANAUNDgG0KOv
         cgYX9EYO9EyGtLI98KwVsmf/i1KJmrU+2j1JbL3pph6bSRR327TvAlgps9ZEDLHLHbLb
         tyjfg2EaqN3WxuQLsbV8IMtcowtn4bQxYqAz3qVfFbhA9ZoQB68OCDJRUBHEqTOepmxD
         jErwAzre928ncN7+wgWzcr2puPB15kppQF92wJEbkldyS3vXVrE1S6mZS7jm0nAsINgz
         zcFg==
X-Forwarded-Encrypted: i=1; AHgh+RrhW7swqm4HmXKKPaos3+2e8eOIoc0snfDs7+kz2ez9w6N0V66yMFo2DFyBYae8xjzuzia9w522eQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kYb3S2mpJ7mrh5k/cb6/QAKMAqsyUEHamA1fQI5+HrVU8dXVQi
	s6Gj+oGdS6HMFttpbWXE3YfkMwWwBuMbhnpnuL/8l7G7TMc1WcphQNFo
X-Gm-Gg: AR+sD11Uhz3yr+yAwscNIYP4DUIdZU6gTylffJIcO/Qflw06sWEE7tmW81gLEDPkt6P
	TlO1XPlN85rIj2LfuChnz69aHrNtC6xRDdulJPD/PXOFaGAjwExaJZ9F9KDCj9svAGbjPHi0mjS
	VOliGOU9Fz6ONKAjuJcB9LKpQAztj9rUthP/0WvBsgb7bKsDeB4idVMv9WFy7elVT3tT4gXw2hW
	P5/vC15m6lNu2rXAzqrp1pOihsQb/5DztyMeht4jOW/4ANGuYTzpRNO0tLOCsRekTFVr+z3blZ2
	peOmpbNJqooWRLeJCqrE4c40+Eh5U/6nV0petOuglytQRdCb5AOs7mC/RgwzYh/h9AUmiR/5ajN
	iaP9epPTfcWn1CQTh3ym9WGI8yro52q/8QUZ++2PTsPr8CqPu4CfICcTxSTAB0+42ZDdVBdQHSp
	EOQMTBAoIqFhW4kg5EyiUxdB9J8koDj/V/oi2Wf8P7f+2IpDOBfAzXp2qwZ4t9CV3RqJoiZ5yv8
	Tl5wBrRU1pUsX1aYdq2atmEAEbp7yhup63gSTZg+z8i4pamjvYNjOiHnDa+pxsy03mQ
X-Received: by 2002:a17:907:9603:b0:c07:43ed:1b3e with SMTP id a640c23a62f3a-c2469f9a365mr3519262466b.0.1787635356936;
        Mon, 24 Aug 2026 22:22:36 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1644654866b.60.2026.08.24.22.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:22:36 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Tue, 25 Aug 2026 07:22:33 +0200
Message-ID: <20260825052233.66850-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two blocks on SpacemiT K1 boards are unreachable from a stock defconfig
build:

 - USB_DWC3 is not enabled, so the dwc3 controller that drives all of
   the USB 3.0 ports on boards like the Milk-V Jupiter never probes.

 - SPACEMIT_K1_TSENSOR has no default in its Kconfig and is not listed
   here, so a K1 board comes up with no temperature readings at all,
   even though k1.dtsi describes five thermal zones.

Enable both.

Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5..03d9ac2f7 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -209,6 +209,8 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_DWC3_GENERIC_PLAT=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
@@ -260,6 +262,7 @@ CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K1_TSENSOR=y
 CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0

