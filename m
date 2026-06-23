Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DB3BCD05
	for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200820; cv=none; b=Jkx72O179nU7vYpEJgiNjhl3/zg7+pgnd7++7cG0ADjM9pSEiMjgsbZuUd8G5vKkibgD6IB/7DJBz+lEIZfpzdsYXJZPUZNb3X5f5XYH5n/z9d3u/H+Fw3O9hh/sEV4h36wFPCKbuHt2CUm4oZ3aO/+Rx+lMLXaE6UolMclvRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200820; c=relaxed/simple;
	bh=6n7H95oCjC1hgvkIqkVmsZD5RKSMNQ+H/5eZ6bZxyIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZIgiJNd1FXwBJ3SNjNlFMcuMQaPCpWFBE1Bu8/zDBwogEYymXVlEELgwUvMc1DBQqyhP4b6vU+fL7wQG4oHchjYWE7QuKHM4fDZthLaRFJP1hyFHCqwkVdR5D4+U7cKSw84NL8w6w7doLSg/758pY8OS3h6iNPS/SrzyK9btL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMP5FbsX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMP5FbsX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8422f148dfcso2944073b3a.3
        for <spacemit@lists.linux.dev>; Tue, 23 Jun 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200819; x=1782805619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=HMP5FbsX3/9uC8JbGApJswDV4/2eVAegxLfVr+LGmUj/DRkgHyqbC5OMAzG3D+llVJ
         voh76xGV6tSCqmg4CHDfP8rqTFUbo2kbLqT5afSC4XLS4qgW2RPmZx/x6cjg9SLioD1A
         Nmw2uaeMlnwIEe6sIgWPHHYU34aooL5gJk2bKn9HujHKxiJW0IrTiwHu8DKrFAkdJau0
         HyBilDNOLmcfeGi8R/utbwmayirKbAVLhMzqOJs5u0/YUp1/NaXviWBykv5Id0uC6ljS
         4xwjzrKP/l2zN/Mpak43i0rWYUvWRNdOIV34iGT4zOPTnjGQAOAhCGQhSG5jIWF9VFUT
         tpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200819; x=1782805619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=G60fdtbSYofINek5SKiRUluLYpBx9mJNpr6GXfedbFXL+UPxTyxUNFR2vHzufHp/dU
         ld+ptMfyD86KnffK1wAPjvTK7qU9+tXNwrXwEcl9P4ho8UWQ7vS+3eq+7fX2kttYHnCh
         OtvuuIgA9zOZaZKzFY+aLMy8ctxaPMRUMEDcUwA9dfc0JbUmxEL03bcJXSpZ+eccXYSg
         D0/lZslhwIRIQqaZWbD+yIZ4h7w1orUVxMJlkum+NaagOfkdlreDR/uJ9GY8cD59NV1y
         jEbDOelZ8G5v2s3bxTdJET8IdM1OuzDTGc1jIgn1obxFoGUYFc+PytLDW/Iu/mRKROow
         8CPw==
X-Forwarded-Encrypted: i=1; AFNElJ8e56W7MCEr8MNbHm3UoYo3JyS7kECXKhCaG/xx7e9eyCuN1GHluayGlTknoHOKi1fPE7PkZwkLYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGKhuzkpdQUFxHgC9L2MpGiQCuFxYvp7hLmyQmZ1NS12zAfNc2
	Kkb2Dcu+H+nzUb04IFly2z28EHHZwpaIw9HbQEHFrYLFy4X7k6+SnOaU
X-Gm-Gg: AfdE7cn+3gPKG1sorFbhe/r0+ROfRqDD90rCKYAwaJB+S+0buhyYXFi8/BgNH9cwZ0S
	2OiB57h7pvOXLi8ggRFKhEn95wG43/Eo0YeTJ4q2Y3YrK7o3gaBG0lGBoXA29xTLq36001UIVon
	enm9q2zHH5PUedn1urNjEfET7YpOVeZNoxqwtD/xigX1w+27sNtOuBUFio4puJYXruRRGC3S7LT
	bjYQkMsU5ajNcjMYi8AJYiT3pH26a2w8QM0d45KGldlsNNQ2TwjUcyT7hMBBD+gbFiU4kQqhiNu
	e1EqW55BM2xni+YJQ7bv1ku/spsHKidHefkhiDyYO3e4joktf4BSNzq7LvSoDEpR6faZcsFY+bT
	XU1vaLY0eDqdxvbD0TwWTuTP4eCsfxVc2GeqANO7Y70rqc/BeEBSizRVapJ2JEBL14f5Swl20Ul
	TBYk8RJMwEM/Z6JrGRkIHB9g==
X-Received: by 2002:a05:6a00:3d09:b0:842:5711:9a2f with SMTP id d2e1a72fcca58-845508a0edamr18772015b3a.36.1782200818608;
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed9516sm9765519b3a.57.2026.06.23.00.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net v2 0/2] net: stmmac: dwmac-spacemit: Fix wrong macro definition
Date: Tue, 23 Jun 2026 15:46:33 +0800
Message-ID: <20260623074637.503864-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix Wrong macro definition of the Spacemit K3.

Changed from v1:
- https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
1. Separate the patch into two patches
2. Use the right macro name for the LPI interrupt.

Inochi Amaoto (2):
  net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
  net: stmmac: dwmac-spacemit: Fix wrong irq definition

 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

--
2.54.0

