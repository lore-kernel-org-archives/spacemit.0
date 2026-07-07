Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542A42A80;
	Tue,  7 Jul 2026 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405084; cv=none; b=a2CsIOdxTwRLOLPkbrbWkv9TwtLctpOQFNeVlcaMowoFhFgkGyC2X3e748/POI5LAgYp0RZYayEpNzivypc+yRM25b4ceY34Rn2mB5mwU8gzJXE/2ABwAeDA4+4BYWYN+mUW1N+5IGv7LfSnofIeh/yf4N/uY1QFlc2dvEjQH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405084; c=relaxed/simple;
	bh=LWoQjKuRIeel909XfYCh2RCKPsZj4sdhdcr63Eh67mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kiqo9/c2TGZ/gF//QzJRpdY+/PqET436U89gx9Uo2CUyiSvL7htZbNuL2q4b40LHfzaH8xtb7wXnZ5MQ+/RMDe9ORHJ7ylA1SE/GYgn56evJ9dKfjNBZQ17v6stspsPTuDrtapI7FpNcY5ZfJNibR2i6kkOWDu3AUtIjYBlQP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os1AnOLT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os1AnOLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B31F000E9;
	Tue,  7 Jul 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405083;
	bh=5yHbzKzGNqiUCBIQAfXyOuu/Ap/WwSqdBvZYe/QZ19o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=os1AnOLTHq6Jt7FndhS5zenrQc8ZDHoss2lgmiMee3GQLoa1k10cyFdgt8AAcmWxt
	 JZKnRTWSxOf+I2+mcCGYmnvpUNDvIRMHfvGk1L4M/Xo9g7bBwCzT6+84SMBDXwnO7B
	 o7fR5Hc2jQdusYtrvTgauhFoxBO8ui5P+32RsPYrnx8nczhjk1640vn7wEoUrIxV/5
	 82PoLs4O5XQ3+5z4IU3YD8/o1Ieq8T+n3vRCDeGK+bXqzLGLokGrstcO0bCrCLEGOk
	 X0Z/OjA870aXM1HZh3gnfHKaSpZP9NTK4pc8r/DiK/cXWL11PkRQN0L0XnisGYqQk2
	 CHe9zWxB+NvVQ==
Date: Tue, 7 Jul 2026 06:18:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: serial/i2c/ethernet
 improvements for the K3 Pico-ITX board
Message-ID: <20260707061800-GKE35811@kernel.org>
References: <20260623204431.498700-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>

hi Aurelien,

On 22:43 Tue 23 Jun     , Aurelien Jarno wrote:
> This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
> default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
> adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
> the RTL8211F PHY.
> 
> Changes in v2:
> - Collect Reviewed-by tag
> - Fix issues reported by Sashiko AI in patch 2
> - Link to v1: https://lore.kernel.org/linux-riscv/20260620062238.3199108-1-aurelien@aurel32.net
> 
for the series, looks good, so
Reviewed-by: Yixun Lan <dlan@kernel.org>

> 
> Aurelien Jarno (5):
>   riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
>   riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
>   riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
>   riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
>   riscv: dts: spacemit: improve RTL8211F PHY configuration on K3
>     Pico-ITX board
> 
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 42 +++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
