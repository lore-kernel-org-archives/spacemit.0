Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4828373
	for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712425; cv=none; b=czgPquBfA277cGkt61BlNEKnjo9DylDUhLeuBMtPygETOoSqW5GCJ4YypUZnidULMIaAQAbNNW4mpAZCaQUcJq6Fxe244AMtWcGBfJZREgNFjHjB3s5nAYrtKJg5mck4+uyKwa1M+iVAGsM+0K1aPe5FXvMtgJZaO3yVo8W93U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712425; c=relaxed/simple;
	bh=1PggnwSVufJ15eLoLiPtMJonLerZeCTUUrMLHt/MvWE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V97y9F/CiHlCqnHea717U6vMNIPplHsUo0MR0SvCWgwzl/5nwBGCweNnrxoOV43aAin5ZlxaGBHxVla1cstVTorSbvMvD32ZA84/9TZkUMANJMdSf9qcRjIorcMZfYq4UOMn9R9XljJS2GFxkLXBAtXanH3wdwS1wupliigks/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9WdGOBI; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9WdGOBI"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2401b855980so9226475ad.1
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712423; x=1754317223; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZbPgCBxEfjAABl7BFhrPe8nrXtS6lUGZ8fQixqxipg=;
        b=l9WdGOBIQFl7dm+aNCKDDj7HALGskeG30l1QK8OHOYsxV76upzEVWSMS+Rowf9wPLV
         nH0s/zyk5aK3MZ3nQHtDbkMDBUGG+i3p/EWvoFZJbOBJYEtdQIaqJdLWj5H9CDHTuZc5
         YyfdklbMXtCOEz6QQ4arjQgfbMNdpQwgcjMc1iw2LxzVOxch0Z0dh29GQE1Hh9aDHzqW
         ShLu8QofFSAsZaKVmw7NmXz3pBtr3UUNuAqTPRRMJ3/iRLohi8GFsuuEzyw2ndDoqLDq
         qFd62V9Rd+/hAHNVzHRciiBlWPdp2oHPXUkZllUgmRKM3Teomm6ynK6KnMYVSY6KMo61
         T59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712423; x=1754317223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZbPgCBxEfjAABl7BFhrPe8nrXtS6lUGZ8fQixqxipg=;
        b=HYWlPti5ToJFizCQ/3VRc3Q39fTg2NWOyNgDX7UjglKpCk0G9Yml+YxXPW8jHLtiYC
         6uawnNA7DHd5LsbVn2sYhuszAeP/75VtTWoP0cahg0Ovx/Akq6rmQR2bQU7wCSNJnz+X
         JePbWE7m9uFmfn8g2fwkJDHmmnwgHMf/x7bs/30NuZUKpo+w3evHrPFar1JWHtzlVqnJ
         7hZrWq8yD2DRj3WAg80i9UqITk9ThM2KRi7CWtADgVYWHcXrmsS4/5db3vSTjU5oVmdG
         xLeLNo6D/0AYPDlUw8wRdjD2haqG6EYgahrG1hbhpIXsw0FK4VcEzBlQwFc3C1mHdVdt
         TyYA==
X-Forwarded-Encrypted: i=1; AJvYcCWso5CUHzgwdFkUp5wNhTsBkZN50l2Z1vsSUKLbFHrAHZvlpjzrGOsQDdt8XYA8D8nBz2aSlgOb+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOqL1Ahh3poU6H1MvsCwEHBKfWU+vap33/+CA0BnalzjIG6/yc
	DPTt5Bf18FuwnqhYV/FLNM+izoFBlX3PJ06+kl8dnHRn8yJqZt1v+PTi1sGn2HS4DDdZtg==
X-Gm-Gg: ASbGncvDhwVNgVcFPCFP41xwS6SOzF+p08yNyZNK9x2OKNJw1ygL5BX/m49UM8/P8um
	Atx9FYJSSZHRzUdUuZfsMKPtue4m6+RO/NgbjsihH+bH1o3bUxv78xA0gP1Na7kxbExnTbdaEEP
	F/AjLFlJJKd5vizM9/GQLmFLMcRtOdL6An27FBBU6xqpfobc5hfTp70CPiy/duY178v8YEQu9k6
	OTwEmLDuIUsMOi4hfleBkAXoUHFm4VdH1ks4fTMDQS1hk5BD1EsDaGw1AjeNdIKnhpSOB+0Q2E4
	CblWgZumTMjArBjBK0TRAYPLpTr7dvr+BsIFkWu6+gxpZy7JRxbgKabXantUk1xzNbzpvHFoArv
	yAzbaLNUq83rnTO5dzjwjrPKQoENKO9nL
X-Google-Smtp-Source: AGHT+IHtegYM4BlLYXwS9tWAhPo7ODJPuXBsbqpjo4lyceFKEN4p/yLS5sVZ/sven5XQoNC9rK1+NA==
X-Received: by 2002:a17:903:2054:b0:23f:f68b:fa0b with SMTP id d9443c01a7336-23ff68bfc5cmr57909205ad.37.1753712423167;
        Mon, 28 Jul 2025 07:20:23 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23ffa4bc557sm36791405ad.116.2025.07.28.07.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:22 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] clk: spacemit: fix sspax_clk
Date: Mon, 28 Jul 2025 22:20:14 +0800
Message-Id: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6Hh2gC/03Myw6CMBCF4Vchs3YIHSCoK97DsIAylQmXkhYJh
 vDuVuLC5X+S8+3g2Ql7uEc7OF7Fi51CpJcIdFdPT0ZpQwMllCeFKrBXqIcehTxyRgUZZW4qbyA
 cZsdGthN7VKE78Yt179Ne6bv+GKJ/ZiVMkMyVW8NpWzdZOcj02mI/15pHWWJtR6iO4/gAm3zi8
 60AAAA=
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=1761;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=1PggnwSVufJ15eLoLiPtMJonLerZeCTUUrMLHt/MvWE=;
 b=8/rLwSFmfnZFKcqahbV5wIBUuymvjJZLulCrEK4AJqVN8GYHfpSpUo+qbM/Du5QUrTG29NJ8b
 ggVx5UlgBWuDTyPGviJ3GCGDdxHb5d8QjCYF9Y8HM990Ykcu7Pyhy3q
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com
---
Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 25 +++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 23 insertions(+), 4 deletions(-)
---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

