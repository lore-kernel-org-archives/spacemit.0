Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772356;
	b=pWYpyl7t+wpfLGffSP6YpdZvdV5bX4mX00PnuVHLZf92vjS38RdgWsobyJRlRyny0554
	 aXow7qdYU6VU78QfKe8Wa/a8SSOi2CzUCQsDTu7UneqAGPadiZTNw9N72ArJdLPWKiiop
	 DFOZcGsTrIzWqnTo7vCDMm5q+TANiLNAlXPmLDnvarMXAmVAVPVXz+FcSEVrZy3ZLowAv
	 QZs7ctQwbSecyBtaLpxkc+dWlbcRIZ/4LlhSfr2drxgo2Nfibs9VEZAacrjwYhXm8Wirv
	 evGuIu6UAo7huKKljFh136ccrEd5ODmMnOLD3OkEWF479bxtsDeyoPfQfX1kPIUI0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772356;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pObfC2ohF/CqwFge111+KxptSo5e+t/Q2hCxcHCJ/DQ=;
	b=cn0v0P6VA2is8nv+zMIyqfbo0zUaonleJKeh9jbPWK3B+nNvSj5sXjQlSoheyYayQxGQ
	 nVvV2NNe561pFbgchq0mbDijYhHmdnhdbUNuFv1szHyVgKE+yqUF17P/QfvaLjHxbDFxU
	 RVLaHVD8+Ivmu4/GY2BDiYNBiCIHwwM/4P/la+c71B1CSqXBdvakIVXjYzw78PfFUq0eC
	 wz50AWuDF8NtULGFtgw6i1z+/WYqjCY+l/8hBx5I91N6csXHFy1cGT7mwwTolT7EZTNvm
	 vPhiqq40RnwwmvN+tDOWbTJVJnztry1mk65dzJwHwQi1eAT2jASFVl7Svl7VQEA4NJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=GIQOlB3+;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF7606A31F
	for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 19:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=GIQOlB3+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772310;
	bh=pObfC2ohF/CqwFge111+KxptSo5e+t/Q2hCxcHCJ/DQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GIQOlB3+axCBfEdcC2sYKOj2csYjZKOlQK4T8oxLlDUGL4if4YaSZEpBBypOdF3ak
	 /jGlFsTF8rWHPYuqNkkGZZ6If5u9fCEDet2fZKiXkezSVQbL5YcUuWf1Mk0WUZ6emF
	 Vb0yaolUhoDcqXyMe2Z3l7RQsfbcgDVOboYInCvdtJ/kra4g7wel2wfDxUeL3fjY9W
	 o20yWlhDtf6mxc+NZpHfmMlMa0l/oM4EwuM0F1bsBIiXnnsJXZGiIRTFDDkl8hff6o
	 z0YnvBQvRw+S5KRPDxYYSeRtmqPEgH8lUMpJBHbOhHEc13N01EVGZ2LW61722gukw5
	 7vwep9C/M+unA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B1087B2202B3;
	Sun, 15 Nov 2026 20:51:48 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>
Subject: [PATCH 0/2] SpacemiT K3 use 8gb memory size on CoM260 and Pico-ITX
Date: Sun, 15 Nov 2026 11:50:58 -0800
Message-ID: <20261115195112.32120-1-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
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

Adjust from 16GiB to 8GiB memory size configuration on CoM260
and Pico-ITX for compatibility with 8GiB/16GiB/32GiB configurations.

It is expected that the bootloader will read EEPROM TLV value for
ID of the EEPROM part and adjust the device tree node accordingly.
In the simple case where adjustment is not performed however, then
the previous 16GiB range may overflow a 8GiB DRAM optioned board.

DeepComputing FML13v05 is sold in 16GiB/32GiB variants and not 8GiB
so it remains as 16GiB configuration.

E Shattow (2):
  riscv: dts: spacemit: k3: use com260 8gb memory configuration
  riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
-- 
2.53.0

