Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B8248873
	for <spacemit@lists.linux.dev>; Fri,  3 Jul 2026 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044669; cv=none; b=hDRR2Yu/KZN7ZmMDv3XmMwMFBpKGiDVHJdyTVjSqARdZ8JL9uhXlLiPzaGLkNe/5LDIVvhqvpwvRpwQUGv278qM0We5D7Jrl7o+5RJaCMNvrBwd2V0681N8ck9ue9gFce8+p+3W7hJ71YBjB5L16tEFtQljo3+mQ242my9RpwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044669; c=relaxed/simple;
	bh=o2jlelQPxV+nzbfoQUAgtVkuNyE+WmmoaGnh8aaogKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Re2LKiGiI+mcZoIlykYcMR0rik7uULZrp+MXTIYYOzgqdqoqOB61h7Yk9p28WLXoB975zViP5CuiWlzU0PbLNBL+6vd+6t1SgCIx48W4G2OQqK5M7PoC/d+AwH72Bafyq0srLlZJORXHmKpUXAUiK+/keVzBca+9YibXLCrf+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K12Qv8rZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K12Qv8rZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847968ca62fso55854b3a.2
        for <spacemit@lists.linux.dev>; Thu, 02 Jul 2026 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044657; x=1783649457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9te5WRnB3/pnQ+/Q0S83oqHxAqp55SmkhfuxRe3M02I=;
        b=K12Qv8rZpnyKQLjEonkZ0wG9cQYzDtUudFpefylAdB+a99dHf2OOs1i7zJDOp7QfZk
         sRdUz/qK/mN0hc8tuml8RWdLGYjeLkrrj7hfBnGjd8IIg0KqhLh7Ms7fBzb3/YKolKzP
         KZKILqTMRf7NhBsYKHSwvTIa9juE7azYkkZMxIbTs3gqnsFuf8u5zz0bN755vJURexMb
         5wlHuhEyIxqKr8x2C1iRZ/2ZpOEJo3BUuCFAYFYguD/T0rcZCP+V8mFibo128+IcY82O
         g5Krf/3/+BGTWusjbpu0wAZT+UVL0ZwD6lvIbtlsoH/zBtffSSyubgrRVr12+x+pskz0
         1DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044657; x=1783649457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9te5WRnB3/pnQ+/Q0S83oqHxAqp55SmkhfuxRe3M02I=;
        b=W7oz4vTneMhpmQOqsHM6JRQLlOeRV3+eN8ZhffQFvpCHSqSOy7q2EpM/4hKdSwSFrg
         PyDLUcl59lr4GqJEZU64SAyCRW9qiU2yQiMfuVpsoJP0exJM1uDCn3AnQjf4NiHb8+ye
         /cmKDA7aAyKnUC69YAxDNJGGTkzr698J8KLFJrpBjHbdUrbDkLqGfHgC9chFOx+eum99
         5M5196WeyjsIXPRHpOnZxtbVWSKp8DDY0tQWEoakAiNOozI2xTn7i5rBgXL3hd4Gs8xO
         6ZYttE/czyBzcTStGia+Z1ki8uhseipOB/ObL3blQwNwvFN6EJlT4xe9gOTMDW1ttMzo
         EkWg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ny5eCciQjVHrYJ4sHAt5oyL2VK+fiQNmtXIv7E0/hclGuNS4K4cv88xmrD4ihNG13Wo8wCEsuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiCUNoT6ORumun3WWYNzJWmnNvRwJwfqq65qUDBNgbDB0xWxZc
	lGAPViWpxtHPvPdsp2TsVPJr5fAL8p6c2fboX7ocje97uD7gc/D9A07/OCz1mMTC
X-Gm-Gg: AfdE7clnsK3IjEd9Qh11SWDiY0V+2z09TA8wpUzym1uWib6M1nxBusyebBB2JmcjP9L
	p+e9bDx4mczBFGRBohg3cICDkH/v3Vew3tbrIgL01JR87rGsVsoveT6nDvXtzLV00q7FyhVNEw0
	0Voxymu8UFxLf6G+t5nzMImdJPwwH8+GkAP1yeIIGef2gkTjLAUUeQKTS7+F3759nK9WcdlhmTj
	jyNOMwkr8z216/SyOP856/32Y56LVdz6P6boleugg/niTR9CnJ9n5hWmZtVUW8N+lVnGzPiBgRH
	UD08xOL3XR4fNq8AzkOYQC3AU47GyJAyIrzPjUuk4pM/FY3bN8mBMttHtZZ1K25ru9YCaAaFyN4
	GmdnIkh1OJmZxvs9OCifDJBYI7Jw6bnzH1XRINFPDxOkn7vX/t68V0eGvvF41QSG7z/WK2wpmp3
	nLsUO2CRc8BTNLTDhM6DBQSA==
X-Received: by 2002:a05:6a00:b481:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-847c0731433mr8687798b3a.27.1783044657351;
        Thu, 02 Jul 2026 19:10:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9b0220sm2124478b3a.50.2026.07.02.19.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:10:57 -0700 (PDT)
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
	Alex Elder <elder@riscstar.com>,
	Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: spacemit: Add K3 PCIe/USB comb phy support
Date: Fri,  3 Jul 2026 10:10:21 +0800
Message-ID: <20260703021024.495433-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Changed from v1:
patch 1:
1. Add extra description for "#phy-cells" and "spacemit,apmu"
patch 2:
1. Fix multiple spelling errors and copy-paste errors.
2. Make some magic number as meaningful macros.
3. Remove USB3 set_speed() callback as it is not needed.
4. Fix the wrong land data config and mask.

Inochi Amaoto (2):
  dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy support
  phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3

 .../bindings/phy/spacemit,k3-combo-phy.yaml   |  68 +++
 drivers/phy/spacemit/Kconfig                  |  16 +
 drivers/phy/spacemit/Makefile                 |   2 +
 drivers/phy/spacemit/phy-k3-combo.c           | 252 +++++++++++
 drivers/phy/spacemit/phy-k3-common.c          | 391 ++++++++++++++++++
 drivers/phy/spacemit/phy-k3-common.h          |  27 ++
 6 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k3-combo-phy.yaml
 create mode 100644 drivers/phy/spacemit/phy-k3-combo.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.c
 create mode 100644 drivers/phy/spacemit/phy-k3-common.h

--
2.55.0

