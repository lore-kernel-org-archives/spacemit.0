Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC94A35
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 00:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213074; cv=none; b=qpUFul3U7fal5utSTsADymVqDqG7QV00ZPGKfuliX+jlsf8mjQlL8IWHnvgydiQrjamFLvRcs4qwa1agoHRAdF7WcG3MSz7UJh0/WmsKHdRaI/Xz1N+KegDQzoSeMz35ZtN68BE6+XZ6A7VNqvXBSNSFMckGWjze4GweZf7cDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213074; c=relaxed/simple;
	bh=yAhwl6rkER7SRzPSIpEu7JfTPZQt3quQFXg8gQr+sxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2otSS9pJBCg99L6L0LIoG2yZYkiwTrbQT1xPcBPJlQr1ejU7x4xcQHYky2IWP3U6c9qy5vj+mAUEHazBo5gnNYMWcH1G5ajyNzSYnqn5aBRapM57mbfsh5j6ih28W3zfa0ZJrn1aNyseNndgQ8Y3bKqy92uwI5ssH0sC73NgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 106D8341051;
	Sat, 24 Jan 2026 00:04:31 +0000 (UTC)
Date: Sat, 24 Jan 2026 08:04:27 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for
 OrangePi
Message-ID: <20260124000427-GYC71302@gentoo.org>
References: <20260119024255-GYC47382@gentoo.org>
 <20260123140625.1918171-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123140625.1918171-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 22:06 Fri 23 Jan     , Chukun Pan wrote:
> Hi,
> 
> > no, as I checked these two boards having too many differences that
> > I don't think it's worth trying to create a shared dtsi file
> 
> I think some of them can be shared? If you think this is inappropriate,
that's true, but I'd rather we think of this in whole K1 board perspective,
not just two boards of orangepi.

> I will abandon this. By the way, it seems that the OrangePi R2S lacks
> publicly available schematics.
> 
> Some parts are the same:
> - emmc
> - eeprom
> - ethernet
> - p1 pmic
> - combo phy
> - pdma / uart0
> - always-on regulator
> - pcie (excluding supply)
> - usb2/3 (excluding supply)
I'm not surprised of this, as most ODM copy the design from vendor.

> 
> Some parts are different:
> - hdmi
> - qspi
> - sdcard
> - gpio led
> - sdio wifi
> - audio codec
> - pcie supply
> - usb2/3 supply
> - gpio regulator
> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)
