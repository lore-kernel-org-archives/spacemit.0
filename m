Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867080;
	b=ZScN847TV/qw3GY/ufx3oJzBg6tNcrqTxNlFka1HZQJpeFAIRgNE/IsXoKlzVvYcBWbV
	 TZ48xah2kMgX2OyT3yny4cmjbkOpd2j96dVIa8ua9LTu2rRqyatzOqlqsI8b0wHRZbbzU
	 rjlY7cu163Bcx7CEGfXIPdzq86vPkcadfe7RV3iZJ83nX1yO6RnV6R2wPmW88OWsGKdCJ
	 0LtZInyTfVxcoBHaeDfIWOIxeMdAfwN5Tc4s/JQQlKQgUBS8pYbUiFLxz/PARhXfsgpyP
	 v+DA7BgQ37jkvL3tgN0nDrTlcIvJ0enHnkSZEjugdnJ8w8gcUsgsx78jJGPOxRTKulQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867080;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=PMy26U+a8p6T/DZbXU09t/uUDgp8RhhSnvRaYUMUKHQ=;
	b=vBicUzR2yL4ULOgBgstzDArK1QH8btv8prFZLA/FJvTNF3VTV8XQ7WZdIt6FRkmRQaNR
	 VMT0CA1gtVB3F1hISejWrTBD5N00wn6KFp32f5c9yVMWMoGqdPlFiQSD4piUqdlBNoEbl
	 byore/M/uDXCcvtguqZ339JS3H5kK3R8F+IwNKpBHpfePVeZ35gg7hRGEGnZvMdBlxCNZ
	 z741zADTITS3b4fHjOmNA1RyQIxZk5X5xWxht/V5t9Pc9aKejdUsXCoeFWVag9HfjHyXa
	 +IPx7OKF7bsrCJvAsRIVRj9zdh/UN/BIIk/JrLMB8HF6nU+iXKAQMrQG+OWTreqT0DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NjY6rKjx;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6912606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6912606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NjY6rKjx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867033;
	bh=PMy26U+a8p6T/DZbXU09t/uUDgp8RhhSnvRaYUMUKHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=NjY6rKjxaGur9PgHybhh7lSd0uVrCRtkziXRcOa8KpTYCkTWzkgIeUUdJUWbZ68ap
	 PPRtB+TAM25GPX4MpUh7hD837B+0P3dVgyzscbK9gF3szgfZeO44oWU4l/0OaJ/Upc
	 A/IDN0MCmyWfOk3GWqNd0Z9rOzN/Nr8oIYbfx0s4=
X-QQ-mid: esmtpsz10t1793867031t33177925
X-QQ-Originating-IP: S5npOyi7aINTfxWjzN8uAgHEA4v9Zxn+qFnXr53kbTw=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11420959379972091869
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] riscv: dts: spacemit: k3-com260: Describe SD card, SPI
 NOR and MAC
Date: Thu, 05 Nov 2026 08:23:45 +0000
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s+4kgLQxXsV0UWHUUQHDtMaEc
 PdizV+9zS8glJkETl2BTB8WTrFB9x24+xxvhOybwSgzaq0GfB7QpWBGhSH59UUoHmPKGGaH1pJ
 vaTscDbTDO9OVv/v9PP0t6+VBbvktodYN44gfFX8AAAA=
X-Change-ID: 20261105-k3-com260-module-sd-nor-mac-44edede14582
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=f8JEl3nwmhnXtGnW8XRJdFD/mPXqxg42zaRBQTXPx4o=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIWnvTgvpOEbvNRl4l7OK8dTZ/zQEUlJO7Xwl9sVh
 QRxOROxjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgInML2L4n8jqofpLSHHf1Y+7
 A74cvuH5+qFuScwd9R3fDlhk7/v94y8jw+Ggh/M+SrqLpAZ6x+Vv0fHQPBj2dKL3QhHJkPu3bYo
 eswMA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NojR6Ao/DkEDqU2b6fuTKkTmHDlm0Tbs2M7YxujsZMOZZHussXiyYj3R
	+WqeYs96vuF6KID9CGnZ5zXN1NZbSi2y6FywaWrAYstTkQ5Ok2TxwH8+MKVNDVbD0Dis9vP
	IxgYnytfEBS7cYB73yEQPfhGUdJL1yE/HGIzJQ2Smd+oNWAnDqhYbzZHLFYCar3GUG8Zkli
	UZMwd6hafZZ4sW0wTskzcljlbm37rVjQ1RGOoq9yeZ7njsDp6NHFsrA5X3gSHB4m/+53E1t
	KwQBNK2799oaOLxq+xyY86HtFF+56k6kVxQfiuMAiveWySFWd3pE5bSUe/g0lVPPhI2iQx0
	9mEB5Y9MdS1cCiSZZB7Rf7EvaySoEHrvYCnu4vxsa6zMmIcJvBU3WyX++nPP5wCA1p+6vjl
	BPw2W+B7bjENlGr79xF1ct6jtSPQFt330D7mAjuRr2FioUj0/YEaUewvXkXUMjbANBRsuWL
	HSjtUCqJGvuB1ClU2gheSLcNrlSNfAcI8ddIQ6/oZ8QURkG4/P2qPXWsUU9a0k62lhKiLAz
	rYKmArs3aCVJUBanqupJJtMU3kydHP273VMHID7VZVhRqX701HF9AUR3VXnA/cQy4UcmdHb
	qURSKVQDhyFQW6X2NfJfJzMiEV8cmwmvWJQZGstF4uG0qOT/wz4+xuvY/YfxIUscPX6ZjFt
	N54M+j/8Q8WK6GeeJgURkjeW0CWSfA7eEXwIZmyuTLAcnQNfo/Ea1J+YHtulmq+Luwh2+6k
	//rLWEfq2EO+QwcI9KlzI2sxGMn6BrupotXWXJlLz/LITDDOX0QHBr4m2liYT5YTrD/rhvZ
	ePDWwq82WI29gD1jVvjGWlKa6RmyIXzckf9d/Yp48j9xYpd32XQT3jZ/PeikNq2+4RwSJqo
	ZmEtks7phlyrtjX2OxQYF5XGL5anWy21zkGRud+whfaZHgLR6PaKFi1z5BxoZ09D1MeOB43
	QSRQZD+DEcr4CAB507FiFkrT+L9+c4S2eUYH0SKR+3tUvaN0xKPiEGNqvRzEMntUnLyD+MD
	KPokLbg0aPJTo0QsBDnk/MOJaPF0n/esN0lGZ37uW/irQL4xnpLr6+57XZFh9pQKbkf5zjC
	4AukmzySxBCp5rtjIlSS5lKMkD1fIsz44II3H/oKIbY
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The SD card slot and the SPI NOR flash of the K3 CoM260 module, and the
MAC address stored in its EEPROM, are part of the module, but they are
either described only in the IFX carrier device tree or not described
at all.

Fix the SD card power description, move the SD card slot into the
shared CoM260 device tree and describe the SPI NOR flash there. Enable
the AT24 EEPROM driver and the ONIE TLV layout in the RISC-V defconfig,
then let the module's Ethernet controller take its MAC address from the
module EEPROM. Every carrier using the module inherits these
descriptions.

---
Troy Mitchell (5):
      riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD card vmmc-supply
      riscv: dts: spacemit: k3-com260: Move SD card to the module
      riscv: dts: spacemit: k3-com260: Add SPI NOR flash
      riscv: defconfig: Enable AT24 EEPROM and ONIE TLV layout
      riscv: dts: spacemit: k3-com260: Set Ethernet MAC from EEPROM

 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 18 ------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 76 +++++++++++++++++++++++++-
 arch/riscv/configs/defconfig                   |  2 +
 3 files changed, 77 insertions(+), 19 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-k3-com260-module-sd-nor-mac-44edede14582

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

