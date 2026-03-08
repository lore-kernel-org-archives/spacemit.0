Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6BC3128DF
	for <spacemit@lists.linux.dev>; Sun,  8 Mar 2026 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772961522; cv=none; b=PU2skjsmgQOFPIr4i3CLUZA5iN+xnEe8er6FIREPdrNDV3eS8V1K4/M97rqTqu/P5/h99ngZqjUYK1zbkbw0IbekhR4Bk0djf3TzpDnq06jhdX+xW1mP9+jOYU1d9DnIWKe/rS/aYfLm4bSgsQeMTUZTIjeSyFxA3QuoPloI74E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772961522; c=relaxed/simple;
	bh=fucfSpewJjtYamNzccfFHnQoOzbrgPVJyeoJ4Inkuh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buJcbqZvSdMCNtrhWEjHLmsZeQLhBaiGZV1rbngfYx5mfZ8eOW+KhYamI2HeWW1stCZZXFwOaWSImS5fADgoGu2nyERFFE1jhDuSHML9CThXarKI0bNzHSwhhZh77T525dpO5EcmTfEKanQjQoGyuh+zS276GD+zwi06sr1BQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ADAF03417BD;
	Sun, 08 Mar 2026 09:18:39 +0000 (UTC)
Date: Sun, 8 Mar 2026 17:18:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe
 nodes for K1
Message-ID: <20260308091826-GYA318052@gentoo.org>
References: <20260302074235-GYB288339@gentoo.org>
 <20260307043806.957175-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307043806.957175-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 12:38 Sat 07 Mar     , Chukun Pan wrote:
> Hi,
> 
> > You describe what's has been done here, but no why?
> 
> Because the PCIe boot order is random, if there are two R8125
> network cards, their interface names will not be fixed.
> 
> For example:
> First boot:
> pcie@ca400000 -> eth2
> pcie@ca800000 -> eth3
> 
> Second boot:
> pcie@ca400000 -> eth3
> pcie@ca800000 -> eth2
> 
Ok, I can understand your problem

> If their PCI domain numbers are fixed, I can fix the interface
> names by matching /sys/devices using a script.
> 
If you want to have a fixed interface name, you could setup a udev
rules according to mac address? something like:

$ cat /etc/udev/rules.d/70-network.rules
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="01:02:03:12:34:56", NAME="eth2"

but, I see no harm to add a pci domain property..

> > Can you add description about why problem with random domain,
> > and the motivation of the change behind?
> 
> Should I improve the commit messages?
> 
Yes, please, thanks

> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)
