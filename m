Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C16440648
	for <spacemit@lists.linux.dev>; Fri, 21 Aug 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787277644; cv=none; b=e61eHSytHD9d0HFFxswo4Z4VygtX/wNzUHEjyb2pLBnEZDXB3BiCLHp6wXF+UVROQxjtukfp6sfg6zAdV58V0M13LlIlVqgX1ytEJgVBQ6B+bXcgvEvBTCP8Dl2bFO0hH/MXaq0TqpzoRb2sbKlII2d9aZwljPJ8+kcwd/ixhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787277644; c=relaxed/simple;
	bh=9ac753xghRJn/27tVS9JoobeWsB8lFA3MSTyYxuV/EI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=rM5fOnm+ZpPLb5HQpZhdpBXDyeXYP6mW1ukmMfyTlxs1Lv+0puXW0QwYyUI9CRGygjrrjBnOioWWhlBfU4eLyGoYq7abWQNIlLTSe+lpdNgGNaWmegq0EI0R5JLs1WMvLwjnUzIfqMoCkOfcojPwtVhpvQOVgZeyPwHeH6emmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FcW9iiIG; arc=none smtp.client-ip=91.218.175.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FcW9iiIG"
X-Envelope-To: spacemit@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9ac753xghRJn/27tVS9JoobeWsB8lFA3MSTyYxuV/EI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787277640; v=1; x=1787882440;
 b=FcW9iiIGHzYl31nZDMkmvL/8BBgE4iH2G4x3Hn44KuOl0mZ/S1yAqHnuWBMnqLGvju955qOo
 lqspBEgAmAGpvFmlTWDJLHgegGLyUwPIVIpeS2YQPu/6tK4dU1ZcMUNCAEMvbUrnIZ5VTX99tzf
 lkihv4PBg+asFcGN48d/R6tc=
X-Envelope-To: spacemit@lists.linux.dev
Received: from localhost (114.94.8.21)
	by smtp.migadu.com with ESMTPS id d136abca33384d49;
	Fri, 21 Aug 2026 02:00:40 +0000
X-Mizu-Trace-ID: d136abca33384d49
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 10:00:37 +0800
Message-Id: <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>

On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
> support, but the hardware has no internal OTG registers, the other is
> Host only. These controllers are compatible with Chipidea USB2 driver
> with some flags set and reset control support.
>
> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
> development board.
>
> A self-powered USB device/hub is needed to test the host function of the
> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
> cellular module e.g.) is needed to test the host only controller.
>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Tested on OrangePi RV2.

To use USB2.0 Type-A port as host on this board, usb2_0 needs:
  - dr_mode =3D "host"
  - a vbus-supply regulator driving gpio126

Tested-by: Ze Huang <huang.ze@linux.dev>

> ---
> Junzhong Pan (6):
>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>       usb: chipidea: usb2: add optional reset support
>       usb: chipidea: usb2: add SpacemiT K1 support
>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>       riscv: defconfig: enable ChipIdea USB controller support
>
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  1 +
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++=
++++++
>  arch/riscv/configs/defconfig                       |  4 +++
>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 16 +++++++++
>  5 files changed, 77 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58
>
> Best regards,


