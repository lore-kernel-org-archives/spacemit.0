Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A319307F
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377354; cv=none; b=El48ic8zkAAn06iO9U0e//42F2EoMGHzS9TZT8g66A1QSbKxlOTcJAUZQtx8adIY+jq5+Yz4qC0JvKqXyYoS84pArJQl3QEiU3WoS0kUzLiR/XqpjP9eAPg25JqYW66PH45gL7H3Q3UsJcM/ON3w9zcR/BOGlcDQOdJpazM33lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377354; c=relaxed/simple;
	bh=11u6eTuG07TD8K0EqLQCl5SKsVXXOKBL7vzcLCZC0DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFZL+Suo3bdTkeut9MpNTrM0LCEqYH79tP7O2awcLrFqcRuI9Weoxb/pkwqOLv3FhgxaRfnlSussvZQJk/qA5iPu/6XtCU/AeE/B0Q1j4Np6Ig2ydnZgl9bnSjhYcubAEec4PwKVzlYMAZXDGEtBYjD7ui+CSBCu053SsJIrTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=LmIm+ukS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="LmIm+ukS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223f4c06e9fso19658465ad.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377352; x=1744982152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMxmUF14/8mW48hBEyGMdh9vHYA4geBoHm6tUaBcjb4=;
        b=LmIm+ukSodCJydHv6O/IX/0JAO2t6uqIp7TFp41YkRgni+NEdD3QAgXCPBZTkyZlrE
         q6HE8DX39qxYsZ40rjggiMNBtma3trX6g3zFHvl27GI0IGzb+S9MsGyCHtQz5Rnd3iQc
         2zpjUMW9GYk9AAic5DpvRSRizpH6mT1HZnivjcnZx8f4oxpbUyBx2a1WpIQh5P+bqbc5
         BJTqicBDhQE9gHqdvOYDw4NM+dCdM0CDRFFBCrD0PZKW5C85nZO+88Qfp+56QefXc1oL
         riyAB25ajA+6xljbkhJw9uRhpaf8gYV6E1gzRQq9mPDuQIpY91pMNiek5YLq1+YfqcIw
         /myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377352; x=1744982152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMxmUF14/8mW48hBEyGMdh9vHYA4geBoHm6tUaBcjb4=;
        b=sv95mZktPyZhTQKoW/lACSvGsG9OvfHqnw54lZa8zeCJMHgbqc8wrAIS+zpa4uEkf8
         vPRfkJ1LXSBaklIJaqHmkBvlJQfnc/yEjHBQh22WLr5VuZHBOCzPeGRG3mGKj0fOobtt
         fhePnKGuHQume7IbzfFOWMneCrclScfvMJHCyRZ1gRSNmjR8m9XcLflVvR8TsLoLAzWn
         S/PDwoTieD9zCQJihmX/rTIKLqEjJDQSRIJGmD/YDt7nnrftx87i6v4Xw9nGkB4KfFgX
         5luGl8KDu4unF4WlV4DmG9a0WmDceuIRGA5dcdRoNae2/oFaCkTvgKZuUtqOOc+dybbe
         c3aA==
X-Forwarded-Encrypted: i=1; AJvYcCX1oRBuPhK/JQpVdcLADYEfspU8CttLu/lSbhixt1fbxWnrVCCHN5J+ABVcOSIFuWLFv+lElUeUyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgHl6MK9v3AvP1wXhC49B5uB0H6PUGkE+XE8mMCFVIPLUmf14R
	mIMzgTkpad7FXOfrDydpA9ZNgF8u/m2ObiO7gH8/QiGio+EV2+ZnlYIa71K4RJg=
X-Gm-Gg: ASbGnctWl4Bf8XFFWo/bJiLYNhkGjLVLQhFnsttK3gYopSuI2WiaB7HPRW3TbTgPJ1D
	xpKGohXa6D8Lyg1yoNWG6rUyCN2okI9qrFWqfJqMYlWoJoMP29Qmon6gO6bTt48uxTGx7UgBalf
	z3FTOFFKDHkXVhkAjw09K5r2RYByOFTmktD9qGT+d1DhsnYP8+JDd6tZePhWT4qYtgXvZMoMIjj
	WL644cm+tUcXg71SV83wbvTEZQStv74AKmuQcA3qRykn/983cViz+n/OCMTr52BQKSxj/51aBd+
	R4kiinUrGxRhZTDloab+8Y3igpu1/OQ=
X-Google-Smtp-Source: AGHT+IF38ohQyrU5BVLNrtAgCLmegI1hrqaZkZmcE1Ga97hpdeODRbY1vYS67kKK1t7zEi3qN8rF9A==
X-Received: by 2002:a17:903:1b2f:b0:221:751f:cfbe with SMTP id d9443c01a7336-22bea0abfecmr45250655ad.19.1744377352063;
        Fri, 11 Apr 2025 06:15:52 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 4/9] pwm: pxa: add support for spacemit K1
Date: Fri, 11 Apr 2025 21:14:18 +0800
Message-ID: <20250411131423.3802611-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SpacemiT K1 support to the PWM PXA driver by extending the
of_match table with the appropriate compatible string.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/pwm/pwm-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index dd9c6af0f672..3835eba824b9 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -37,6 +37,7 @@ static const struct platform_device_id pwm_id_table[] = {
 	{ "pxa27x-pwm", HAS_SECONDARY_PWM },
 	{ "pxa168-pwm", 0 },
 	{ "pxa910-pwm", 0 },
+	{ "spacemit-k1-pwm", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, pwm_id_table);
@@ -149,6 +150,7 @@ static const struct of_device_id pwm_of_match[] = {
 	{ .compatible = "marvell,pxa270-pwm", .data = &pwm_id_table[0]},
 	{ .compatible = "marvell,pxa168-pwm", .data = &pwm_id_table[0]},
 	{ .compatible = "marvell,pxa910-pwm", .data = &pwm_id_table[0]},
+	{ .compatible = "spacemit,k1-pwm",    .data = &pwm_id_table[0]},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwm_of_match);
-- 
2.43.0

