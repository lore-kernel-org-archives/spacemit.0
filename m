Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296834;
	b=HVQsFhZ+uJL2bQ7St3F3ahL+6Tkc9gu1zvn5wV2vKT28IMtJKzirka3p4i6b2Bfyr8AV
	 E4BTPs7WuIeHEqAEuBCx+07HDSbSjdMoObbEked0w7oD74DWOYrOnqTruYgcnNE+CF07C
	 aCiztSOd8GrM2Mjf//PPCTtVgEahfZunkhfWmr+IiYD5mLcen5GbIpI+/vVteJ82H1vfH
	 pxBu+MQx1u4ZZwGa7puhCNlqSoi1b63j0ROovFfboq6J/L6GI2PVo24zCjqFfhflagm7v
	 p5YjCuAgW4RXJ1GwjIOyxZ6Vn4zQwRFSlpJzopEQPpjFwJl5Nckq1Z15oOMKqeTl1pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296834;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mfTY212zApa5ehOLo+920M5IDmH72kkgNtIxDrvSizo=;
	b=TCy5hFReMZLruyjNCUxNXszma00o8TheIqNGlYEiM3cIPh2GpkF5mGPxJck2RNSQ7YQb
	 ArIkhuaWRGBG2br2fexyjKsUj8jKJPF5yKkcMjhwl7eEGVseAXzYGH3UKXvSvVPsRY+mM
	 hdd9yi+Xc5EZMWxT/+0thFAJ0PflJOKU9s0K39xm0eCEKZCf+AaKRmSgqZjX1Ya1gagRf
	 BL/sO17Gg6ZEc5wETupzS0LmRkCUAnybS+MgjZyad9wCVBGdI1EB47+vosW9PPXUtPloa
	 eScWRi/yAYQLOjwQ/lDkBgNMN5dU9ZOhqWYixGIR26un3wkAtW9thRY203x+2vG2liQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=c3QPy4YH;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED430606A32E
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 07:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED430606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=c3QPy4YH
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id E98E320D78F8;
	Tue, 10 Nov 2026 08:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id C9D7620D7CF7;
	Tue, 10 Nov 2026 08:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr C9D7620D7CF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794296829;
	bh=mfTY212zApa5ehOLo+920M5IDmH72kkgNtIxDrvSizo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=c3QPy4YHf6uoEBpjCpO2aq4SeEQklbaMPaB1SxoJmL2pfYAxXnHOmBbM8Ce/6SjZe
	 KzQr3/RswObM+fKbEg9CRG3nMVtl0fCbdx8QkkbAxwUc/ZfK7TwVgb6tzDXr+PyTwq
	 h5uqtUMtjamdqozSHKzmxJRYVIp5e30Hievr6oF4i5fhN6YyEHhl2dPQ9fGuFtm8sg
	 VGEQKHGWArHOp6vUQTfeGshTf4A/puahEadfkW98UJT6W0tSFHLMnp5x8spZLQekWn
	 uWkI4lm4Lt+t5ILJZ1bSeClwARJOapjSZkEzWs61hSsb2Er55ggiaOJxd2EdEthyj0
	 mFFmgwD4T564g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id QGSqc_bMMjO0; Tue, 10 Nov 2026 08:47:09 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id CF35F20D78F8;
	Tue, 10 Nov 2026 08:47:08 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 0/2] Bluetooth for the RTL8852BS on BPI-F3
Date: Tue, 10 Nov 2026 08:46:05 +0100
Message-ID: <20261110074607.363918-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The BPI-F3 (SpacemiT K1) carries an RTL8852BS Wi-Fi + Bluetooth module.
Wi-Fi (SDIO) has no upstream driver, but Bluetooth on UART works with
the existing hci_h5/btrtl code and linux-firmware's rtl8852bs files.

Patch 1 documents the compatible, with rtl8822cs-bt as fallback, so no
driver change is needed. Patch 2 enables it on the BPI-F3.

GPIO usage was tested one line at a time: GPIO 63 is the power/enable
line and GPIO 64 the device wake line. The vendor DT also drives
GPIO 65 and GPIO 67; Bluetooth works without them (and RSSI is the
same with GPIO 67 high or low), so they are left out.

Fr=C3=A9d=C3=A9ric Mah=C3=A9 (2):
  dt-bindings: net: bluetooth: realtek: Add RTL8852BS
  riscv: dts: spacemit: enable Bluetooth on BPI-F3

 .../bindings/net/bluetooth/realtek,bluetooth.yaml | 11 +++++++----
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.47.3

