Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580133;
	b=ey3xB9/CWh5T179I88XFmj6DLz24tkHF/P3QXNmjUblv5nfXNmmioPRPv/5WRqR7cQUc
	 U4j4az9u1lT70WtEKI/nuCOAw5N0hwYw1emfyTmR01uQkpsV7L+0yiqhExr73ekiwj8w4
	 YOP1ToQqFk6SPp2WqI+Vw2rpU5ajzCP64g9JpfNEE2gkHofMGc+SlN5WwrfIXzweUkMjs
	 iOvLZwT46tAAhqD9y/LmKwnNukD33NHI6IShZNH/aEpd7ft+Gy3ofNoo2QvTDjcGU1LoN
	 gifBJiBH8LuOmnW3AYz8BtJznl3d6Yl8QVWWX4gV4zF5cJueMLVPc9R3UZ4x0rbb13w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
	b=KJOqgDNDGlkITuOE8LdNlh8WbriOT4IZpBh3C8RxaVU5RltNwIbF+x6dbrztmNiQb2HJ
	 YC9vvn5EfcjmCvUrR6vIy1hs80f3SZgKIvRgyF+pnwWNG3wFaDg1hvmZrmHVLLwEFWrjc
	 eW1jEwDbDiSB2EOoLRilsg5vGgRm2grFPi3bVioVTUA4A82NiYwlcLhJHZvjckWl1iue/
	 +s5jdqPg4F4rHjMhHW1N3c0kWqNPwJaHgxC0KncI//J3kaMDtCdNPBGbkzBM6S5cxJlKu
	 3jbh9Of1GpflV/+KFV3pLywd+gGx35asUCNYqiFmPGGO2e+1RnyDl0jX2BOBpU0/kGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phgs9CXh;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C20606A321
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 04:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phgs9CXh
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2425646a12.1
        for <spacemit@lists.linux.dev>; Tue, 24 Nov 2026 20:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580133; x=1796184933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=phgs9CXhsV9FhkXFItNdtyapMl2seOvid+pRO1juXNu+9D7LQXH9llIkuGKwmxXYE9
         QzOM2+2uz/KL54JWuEwqZW0rY9UkFv3DMIioibmj/2m+wv/sZ7cNijD5dheQDFsImAUE
         2giVAIU1f1/9gTxUu+lm0F8jOJsukLuGGHltdpHf7fIY93fQoAPIAR259bER+WCMtVBb
         lqBXpH6NgcJo78UtUuTDi/CP9LCV8fXD+esL0NYA29Yjm6fByqRAEUUOJxcnjnDGDjz8
         S0dANSRZzOXBw0DC39+jcKE53UbPDmfmSOnyBCZO3of4rmBt4Bs17VhBx+X5ucKb0hzM
         l82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580133; x=1796184933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=szCK1iVtTzQEi1OVqYjjuPbXbxBVtCXj3XoBUkEeKcIhGvqldZNiiTE57D2esKJKlb
         9cVSlrpa+ifxt8rZihLueqw13MoOx9Y4Xh6TXp1LNeB7YXvIqc2HbnbdcN2FWrY92MA9
         s+HM+jxmjx5gQofAIjR4/iFYJVW+rJ5LlEgZiM4oJX5858CbWd52tTM0s0TRpUr1Jnm/
         LAQPlctSlM7J88DHj/DjJ6sPXEMqsX80H9t+5ZF6O6SY3hQdVZObIsTsa0R7Q2aOx8Ei
         namvfWvyF8KEjnKiSsV5A8HJEiDyuXqBYDfp5DCXsgemahLgWaa099dIonwqYHFsLqel
         Ilig==
X-Forwarded-Encrypted: i=1; AL+hErG+b5LwrB+MGuTbE06cWQnYcSpFw4htREkVLkPADOJlLil11HMde3JEQLVr9IPRJKxJ1xq95SLHlg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/naTf2Z22PwhVMMtkc+1aK4GmHZGUzks9bapt7YuhZwxSSgp76
	XSa/kImiaHima6xtSxN/NJQ6QGkIDju3hp3+ITJ4HSskWv3mU25qzacx
X-Gm-Gg: AZFdTZdrZiJmqQTMBq15YDnWIq0AfQ1M5jSLXib8SKChq4ya7TLWr1RDIAyeqosrmQF
	2EOF3FUqxnD3mKbHK4pdXi22YTK7ivS0PhRfnbkukNP93lmg0xZ+BbuKC9BC6bh82mA3/IPTZtV
	cynJsqNlzpLwWYpzs/Ncjveh/cyEsHkhuk/+5soUbudBCvmv45K4+1Kg6NlTD3MOFJsu0PIS1/a
	Oveyo9EC552qyogutAOhbvmD3hPVX2eLnvsy/+cUVJa+/0hPKeXvsrb0xUyC40TGJAwFsQBHOYi
	TInGqzTEAB/CV07zLs9tTC8r15Qd9CWLv/v2zxmLH55rNDFYaTnEDeN0iHyggBd7NEM3MnfCm/k
	JODmIumAU5vi9C7FHaR0bmv36sFqgb5lNxhBqAquwG5nn5svWvfWhI98BlI5A/qM5pyvbKvZPQq
	MXRYCCQV7lumToHNtut5FO0SANtsKv2kFYDAhg5j7LNATPYBm14RNnrx86rwAjlOlt1yaInJTiN
	r7W8wGklMc0ggz9EqHMxqAokcUVx1HnDIAjSpJEBNZjYH70cb8maUZ+AGsnxpXsUfWOkrVC3MkE
	/Kx37iS8zL9nx7/li7IY+u1ht1w=
X-Received: by 2002:a17:90b:4983:b0:3b4:1357:d529 with SMTP id 98e67ed59e1d1-3b41c97c444mr16500146a91.51.1795580132845;
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm25848152a91.13.2026.11.24.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Wed, 25 Nov 2026 12:15:14 +0800
Message-ID: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/

Changed from v7:
- https://lore.kernel.org/linux-pci/20260929083755.458238-1-inochiama@gmail.com/
1. rebased to v7.4-rc1
2. Apply Andy, Rob, Aurelien's tags to related patches.
patch 1:
1. The const declaration is reserved, as the it hold the pointer of the
   static const data.
patch 6:
1. Add comment to the PCIe topology description to the commit message.
2. Fix some 80 chars line problem.

Changed from v6:
- https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
patch 6:
1. Keep PERST# when init failed like the deinit.

Changed from v5:
- https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
patch 1:
1. Return ENODATA for no device data found.
patch 2:
1. Add power_on/power_off suggested in [2].
2. Add zero phy check in the driver.
patch 5:
1. Add K3 device description.
patch 6:
1. Update comments.

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 235 ++++++++++++++++--
 4 files changed, 268 insertions(+), 33 deletions(-)

--
2.56.1

