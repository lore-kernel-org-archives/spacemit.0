Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2A308F34
	for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142479; cv=none; b=Et2cffOD3/wrZfRiaLIbigwQPRe2jvW5v/Q+j1Dkh/uT6VB1x04kgHR5PW9gEC1vh9TySh2cREGuSwLGzIGmfWlwWTos9b6moG1PzCfWfZDmBhqDuT1QQbM9BENm5oKbw6KF2ayxx02vxjHKO321RE5kT6VdUZeEJABHYwYt+/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142479; c=relaxed/simple;
	bh=D00Agu9o5lMwHglRF8JEmN9Mz2SwGM8gIpQ2brQAJHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3Q66Cf8Z27F+dZAVaaR379JIhdZwS+y/DakVo/EAk4AXmiCd78tjPmXolc+4rnWsm0R17yY5Sw9RL0DgfNxdBMDYLDtXbiYvn/o1Q15SLHAt63DT56xMIHIcIL1gPjiEtJXyWk1FrjrC2nWjdEbFY4e8VrOml0wrQWWChmpjbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rdIhf6dF; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rdIhf6dF"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-88432efaf45so53166939f.3
        for <spacemit@lists.linux.dev>; Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142475; x=1756747275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=rdIhf6dFfWrKME3KjFuWp+wsZo2/KUnN/ZLxRhpynfo45SNPd/HmpOR4/M6ckOTiY+
         dkBiN8RUNJQ3vNQ0etIyDzwZ4vplaiPtddihLUc1VmdB9lH9HcsxC/AVqdIdGgag7uyN
         GBgJ1ZTlSqawGkBd18cP79/ys/u1UrW74Oy+pDxjrZl0XagVlLbYVWzcY1Pyxd9exj/e
         VWVhdZ9e4gfTa/ucTvg3KYBinAmRJkaurqml4ZWADys1YIK+Ff14LVLyD1ZQCOZI4FaI
         7n9k9lUqDm7Xd5i4Qm0L1A/MlhPVeX8xBO0XrChaMAhkhgZ60gHIt4MLGZIrMVr1Qu3y
         wbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142475; x=1756747275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=D9bp65N6RVqA7S8TVrNnYUob9BuH+BtDHssR9RHptlDYL+IPfmT6hJs3cX+KcGm5OB
         ezPMziklV9r4mSdfOEr1rmcSKR9V3xuMce1AjLejqL2UWVD05t2tpYG8yzTuXT0rLqb1
         IXjuLru3g9dTGwgO3WlWf3xVG7WH8z24oJTD0+p7nxwak3hMWVaM00vkBZWlpaMSjs7P
         6L1fnJRI65lNAi1EV8qk2vAJk2F03yfoNEERT3n9FIyqtQFZaGpHMaRv/ivQvFIdEPxl
         xqJmtft1gP4MrpkWajp5PN9j3RcuKEf2zuOUctbxRpw8Qpa1uZqceFtTTuovbed81RiX
         +8sA==
X-Forwarded-Encrypted: i=1; AJvYcCXr6VaZkc1/SfqMwTLQcj2HOhX6zc7d9/tZlH8ycnAnEn1TTgmhkVT6BaLUaw2JbOM2XKAbGoTGNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/PCKO3sXxjT1o3EJEuTbyATi9JGWK040sDXUg7djfQRYMqYr3
	7lSt71N/bungIJmjGOlnLFUQpRrRUTzebRMcZHf+xc0C1LMFoPhc8gyz5jXxoumAtAE=
X-Gm-Gg: ASbGnctGP7KpGF8GcxW+G2rj/PUv/gaIQsNf516Xpldgfz4I0DHopPggCIhRiLIacuA
	HxcQysSpfKbV2XPDMxbd1fr2MWZCj6yaq3f+s/+8noO3o08z1R+6/vyEsE/heSF8jusLDQd8sKP
	GEEqnA2srPgeKu5PnJKAl5cN2Lhg064Xv/gO3yYpQkDZ+yidrDWNLmcxy3jQK91d7LaZJF/Du7J
	xfsjpHsejdYAnTycBkF9csQeLp9SgnFu+5C8NlqLU4AJdVmjHZF3/I/JQROsR+bkLKxMd0V9ano
	8O9Gknyg+pqQkJucytmGPYTmPXz9wThH7ZY0QtSV5MsFXe4s6Oeqzdr9iAlORIvEE9mRxUOqord
	n2Tc2mQQi2hz5+jsshLi+q1HC8ywGZgqBAoInEbTBR4TOZgl7+bhdQPgQV1MpNMDLRA==
X-Google-Smtp-Source: AGHT+IFaVPmcRIepO8mSzmP9PzGXjZwSc4TayWxRM79v7g/HByE5zJt50D0eHv9Uu2pV8a3THcTTMA==
X-Received: by 2002:a05:6602:3a84:b0:881:6cf9:b8df with SMTP id ca18e2360f4ac-886bd1baf78mr1747744339f.10.1756142475231;
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 7/7] riscv: dts: spacemit: define regulator constraints
Date: Mon, 25 Aug 2025 12:20:56 -0500
Message-ID: <20250825172057.163883-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
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
2.48.1

