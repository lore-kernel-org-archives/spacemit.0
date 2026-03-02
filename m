Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14513FEE
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437362; cv=none; b=gpPmRjsIgFhJ/VVwcY81JkdVGThQEbMkx2q1aGT2U3wzAGw4p7MZqc7qVqQHzgbDEccwhnSH7ef8tgw8AQGFpMLoJ3IK6D0mfkaBFCmqhybDhbxEAfewPzp1FlJ+7mtZiPm3kVQZN8+/jxH8HJiuuoaXPKpquf3KAo7RdC1jK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437362; c=relaxed/simple;
	bh=1qUC6s+UyJSk47Q6no4N7KTAtBbdFnjO20xN89QX5ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKQcstUkppR3fmUr/b/UA+9EjB8ukw6FAxAOJAT6h0NqdHBlhNYTuiaOZMpnCGwqB7NDi4fhwPqqrPKz85CLlc1+PXjBOe3ScLl8UY/rNTKVFk9xjjaUr4ll8uOEjkBYswZmv2yc4sDy7prPiTIRlXhRO3pkTc9YB2dmQKq6h34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1572F341E82;
	Mon, 02 Mar 2026 07:42:39 +0000 (UTC)
Date: Mon, 2 Mar 2026 15:42:35 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe
 nodes for K1
Message-ID: <20260302074235-GYB288339@gentoo.org>
References: <20260202100000.19176-1-amadeus@jmu.edu.cn>
 <20260302071502.63672-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302071502.63672-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 15:15 Mon 02 Mar     , Chukun Pan wrote:
> Hi,
> 
> > The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> > 'linux,pci-domain' property to assign a PCI domain number to
> > each of the controllers instead of assigning it randomly.
> 
> Does anyone have any thoughts on this?
> Without this patch, the PCI domain number is random.
> 
You describe what's has been done here, but no why?
Can you add description about why problem with random domain,
and the motivation of the change behind?

from my understanding of reading DT document, either way seems
fine..

> ```
> /# find /sys/devices -name net
> /sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
> /sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
> 
> /# find /sys/devices -name net
> /sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
> /sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
> ```
> 
> Thanks,
> Chukun
> 

-- 
Yixun Lan (dlan)
