Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD7215055
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107767; cv=none; b=KzSQRLE3zZZLynLVkYKGcZSJp2QBK4lbuhB/l5n8oV1TXeDVSjcIlPRIrCZwWAHPGi8qI/3MjT91IU7CpNiLV/W5ARbxHnFPobdT7k7TpeALkUBPTMtI7ht3piNd+Qrc6dsoct6Hu+GKHwLfET9jKuQ67X6mjFkA4wZaz981GvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107767; c=relaxed/simple;
	bh=JjuvhBN3d/bFg+0VkFskoXUj/P9+g0NC/i3Ipo9goDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRRssdGANqTFTWOtozGxQgfEjGKe754GnZVJI240wbi2uwfvvIqgB+A7Il6Lqs4qGYqctssyHPdIOF9bcMK0YhcdDIjyPQbLOlN/4aUx5DS+lIjAIjxDjqlElfGBGD1DKH2zHgwTqBnxvkp9zzNYhzXCp5/tx/5LVWgNHwIDXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLxJrHdO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLxJrHdO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f0f875bc5so17427505ad.3
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107765; x=1766712565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=WLxJrHdOH4n8zA3za0pA1eYvpUxU+r5tnGkkgSih0QFMEyaugIt7FHqDdT/nDHITSL
         kdgSTAN9PoZIGeOjLjpTDnk7Gf+aC89P9FNrT61sdxtvJWSBIrXJzQmXwXJJ3z1bQhcN
         jAxoMOVP6pwJYFkk015qP1SUbdHbtitHmzzo4xr1BkT0SdPCJMyT3PMa0XGKx0p3TbO1
         87NI/h05HX7goLhMiLqWhBQXDfCTYJexkuE1apxB7pwyurFBFac1fa5Q569jrEIo6JE0
         LvU6l/GO891m2Fa8rd0/n4i05CsCYDwDrP8PbbutDSQglgrn33+wLcO4zul9vQbkhyBi
         UfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107765; x=1766712565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtK/f/sYZ0T/CDz6wNZi8kpvO1eTA7THBDv7eoYu1c=;
        b=Rvoy9kfYxyAvnoGs/WSBMVfRvDQYUAfPYof/aBqPpFsTOx7sieY2eL6SBEBiUwbHFX
         M/MVzMhQrOE5CKp4tFiG3S0WJybKi1O25iCU+oes6nMhUal0nelnc/nh7nmKrpCMR7FT
         Wap4ytqOJPjnF8Eb4+LyzKN/6e90OMdMdQrd4767Y58dRFWY50GF8+Nc6qZSp4DH80f/
         9N9PAeonGDTNtbxLFHqPXseNGxDVpfA0K315NuOR3IOeEBixdp/62RXzCx/da4qSacii
         QTplOD5pgSdLSwng0rf1rCqXTPXmvt0e/FiL9oJunjLu+Fn7ltB1IiedyCJ4IsmlG9Da
         grlA==
X-Forwarded-Encrypted: i=1; AJvYcCW+nnKShSm42y5h268Emjj6Qgr6/N9G6DX+fW6opr/z0phvQXwz1UluKBQ7qKrD3PtnPoPOEXFcSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfSlJ9CpjqGDfTdQZLaLnOle4zs8OEnJMURaiwgyAnhbj/XvEW
	xaIg0JdXq3/SFeQ5PliFBJkCBQN/zkYZDma267YhrO7/ayNSQigroPw9
X-Gm-Gg: AY/fxX7bhFudMXhKw8nJsiYHGKOAZBLz/kHGURbEcKJ/bRKB/obklzp/pn/xniCvLmS
	G5Qah1fkj5EoEOtyQuI8Zp/5SVPcAKzAScsv/lNIMeU4WJ73B/PcGl/US/QoUxtvai02mXgl+ev
	DsRLy0VKgE9fhJzOV70i+q/BioZZD4R9xjQSlhbMLOwe7tsJesKCXr6xKo8Pz2DqzBSd2PA10h/
	WblQPBSNRBEUuYeZnXB0tOM1CE0J7OJgzMG2BgIjfbn+MeSaS6R9yX3H4gQMD9Z0+Z3QTlybfgZ
	aCx+R8nASetqK5QP6EA5CZuhO+uHTBD/d8481Epwkd/qZiO6Ai91XqppEAjO3PIRGU0RM3UN+Ml
	56DaDNRnKKF4QvH58TB4HHCN/NzTHE8EeFnp75QBAePH+3MPfVcHTmc6WKKC2m6Ft9T/WhgEkxc
	HgCgFiOOHAlw==
X-Google-Smtp-Source: AGHT+IHmCsJOTDpegNz1zbKi7qV4zqhXPVuzMhRGlv8/8xKRdA6N3Lz/R25WgxpM69DLVt3TUiIsaA==
X-Received: by 2002:a05:7300:2315:b0:2ae:5a13:97d8 with SMTP id 5a478bee46e88-2b05ec030cdmr1436191eec.14.1766107765232;
        Thu, 18 Dec 2025 17:29:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm2058701eec.5.2025.12.18.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:24 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Fri, 19 Dec 2025 09:28:16 +0800
Message-ID: <20251219012819.440972-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
SPACEMIT_K1_CCU. It does not guide the build for common clock codes
even if it is a tristate entry. This makes this entry useless.

Change the Makefile to add a separate build for common clock logic,
so the SPACEMIT_CCU entry takes effect, also add necessary
MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
build.

This patch mostly fix the build problem, and it should serve as a
basic for the incoming K3 clock driver. See link.

Link: https://lore.kernel.org/all/20251217001833-GYE1903981@gentoo.org

Change from v3:
1. patch 1: change Makefile to trigger module build actually
2. patch 2: new patch for remove internal Kconfig entry

Change from v2:
1. change namespace name to CLK_SPACEMIT

Change from v1:
1. Use EXPORT_SYMBOL_NS_GPL to export clock ops

Inochi Amaoto (2):
  clk: spacemit: Respect Kconfig setting when building modules
  clk: spacemit: Hide common clock driver from user controller

 drivers/clk/spacemit/Kconfig      | 14 ++++++--------
 drivers/clk/spacemit/Makefile     |  9 +++++++--
 drivers/clk/spacemit/ccu-k1.c     |  1 +
 drivers/clk/spacemit/ccu_common.c |  6 ++++++
 drivers/clk/spacemit/ccu_ddn.c    |  1 +
 drivers/clk/spacemit/ccu_mix.c    |  9 +++++++++
 drivers/clk/spacemit/ccu_pll.c    |  1 +
 7 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu_common.c

--
2.52.0

