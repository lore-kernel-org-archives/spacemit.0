Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEDA230264
	for <spacemit@lists.linux.dev>; Thu, 30 Apr 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516137; cv=none; b=EGpmFYZdqmRucH3X6lx23UFbaI662YJ1sNGxOhrNF0rFT2Ga7jKCwZ/TPPMW/DooF97bSTE9zO8IbsEH7Y6jvqo12xjUJwMVQkU2envqb1VUAaCQv8btEXJ9fN1UhQzsgmDoQjzb9tGn9+sN+/F7NeHd05SrHuX82Z4coJXM6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516137; c=relaxed/simple;
	bh=fpI7ThcAkAntW6jxg6C3O495NPhVSuVAiCMm/40Z5xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fK5XuO6Odb8LLbBNkY6kItLJSliAmH3huI5M1IvvbJGeTXJ7Of4QdM1WJE6rLFD2LWTngt4X1sbXssFck8LDFl7TPKX9YWyIkVWAUGUVqecx90idImBHh+iD4lyyh3vJFllJ7rCkskKZz168uvjGGUzaUG5LKlp+W2rn8pvD1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb1z4hwF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb1z4hwF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d95017a68so258654a91.3
        for <spacemit@lists.linux.dev>; Wed, 29 Apr 2026 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777516135; x=1778120935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvKNB8FFlV6JIJdaaGCkRo0LW6S72vZF1V6svTAMliY=;
        b=Fb1z4hwFsmxqtyggMmDB2lx6tjDBp6CRUlAiHAq75+g8QHgMvRrK58fs9z0OFPG9lS
         0Nk0f+i1nhoFFmeiKs290gxswrrNzKS8caboqonW2PCJSA5EhGi3HLrwK6nVKp075GHC
         kLZ1DWbPhEGoxSBYj4yatYl25Qc64HG5CD2Yo562NjzzL38G7UwhhauD2ZTsVuNIREmr
         +BSxaKzGs20gRk9L5QoULJkakTXYF33NONyMgjaRfkonv2GqfLgKm8pe0fNZnbmqvd63
         AFKfeMOwWWON3H0ngMXinqDowMSfsFeHNsHGclfYyOMul/Riqrkjsuw9sXussvitA2Bc
         yQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516135; x=1778120935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvKNB8FFlV6JIJdaaGCkRo0LW6S72vZF1V6svTAMliY=;
        b=TLBnrvBtzXwlLmhhuI/fTlK1eqbAjtjka1KVwaBvkqmBohAAmuI1uz2tcoGJOEyL9p
         4bOWRl3F1Ys0aVCxOc6oX/ZgfLSnfCM7pOjGEQ7bOZ2DQ5oJbenFVNVKbuBg8+Y6dKOY
         iFU+ws3gZiv+nV7oVNJC9rF7Ow/c4XcZWSaK96b+Oo012X/pvTAajFolI7wsPes3LFqC
         Aw59wP0cWXzG2aRgvyHJV4Kg+xa589r4Dy++IBj52IlVNe3/VSK5RJO8ibdrpQXExNLS
         31QoBE1OuJDVz7JQHeVmGvQVNVyk3aUbHJZOKtxJtJGvl3lP2dMJN5wrlhOnaSxEEU6T
         pQcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W+N+2OC7BsE+/cXnk3VK4wfYObdoHfkoN+NVpIt90DlA93kymF875pMoAWSB7N4GndlPw2q2oVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6PJvk27am1IPgZRn4uKpqEtQ6L2crI5TXZpQ+qI/wTWOSB+Eh
	d3DrjDxtP/SdlUsJpNMXd1Cz2BATFHFQZGBwhudU8+VdASb4Cp67Yp7U
X-Gm-Gg: AeBDievtH3nK8eCmi81hPre45Bx/wjYRZv8lsw165AZsHIIZIJteMEuSoDuJ2Nobc1n
	LthFz/20dRIkPFoeOo0YWBSvCDWevyyGUr0ZZ78Wez7iRDFklMD6QzGTMP/6x6vqTFQ45eoC/UQ
	dAfBoVyoPRMppUT8s2DIXmNtEeACzjZiDzq8VeIHLJN9PDQ1fUDXYO/9AFrftsOibFpMrGnaCmw
	V/u76V81MB0leJ2+djA+tqy6klH8KPVocfl0C6XrrfYZgyrSbzpcMUfPlRff8/GPNmHNHrAOZEe
	DDIN7aiVHoHkl2t91/u352OypCZr5goHAGKe7nuL7NkmyDBEM3cZDH1Nikh2iGVgFCmNgiYY+w5
	Rctd1gOPnjNJvkIKTxX0HR1Ctlh/bxx/Lu/fEGTwMkUe0C008Xsn4Uu0ihyymm+Qj/VcXTS8jLq
	3ZQCkkOu6TE736+AlvwKGL+AB5V4P07mc6zw==
X-Received: by 2002:a17:90b:3c4e:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-364c309c2b0mr920821a91.18.1777516135395;
        Wed, 29 Apr 2026 19:28:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2a71bsm987033a91.1.2026.04.29.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:28:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: spacemit: Add K3 PCIe/USB comb phy support
Date: Thu, 30 Apr 2026 10:28:39 +0800
Message-ID: <20260430022843.1090138-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe/USB comb phy on K3 is a big phy that contains multiple
standalone phys for each PCIe and USB controllers. This phy is
required to configure a syscon device for mux configuration and
calibration.

Inochi Amaoto (2):
  dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
  phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3

 .../bindings/phy/spacemit,k3-comb-phy.yaml    |  63 +++
 drivers/phy/spacemit/Kconfig                  |  16 +
 drivers/phy/spacemit/Makefile                 |   2 +
 drivers/phy/spacemit/phy-k3-combphy.c         | 250 +++++++++++
 drivers/phy/spacemit/phy-k3-common.c          | 398 ++++++++++++++++++
 drivers/phy/spacemit/phy-k3-common.h          |  27 ++
 6 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-comb-phy.yaml
 create mode 100644 drivers/phy/spacemit/phy-k3-combphy.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.h

--
2.54.0

