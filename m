Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A121D3C0
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 02:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665013; cv=none; b=YDk1UgNyTb/VT84fx4zbam2XphPcQdNn/eBMkngfn51TNC5JkI9eaMwPsAddKMBguU7JCo1Miug59s+H+pasz+osOds0Tw30biso6jJ/r7yzg53qhu9bXVeDQvXsDaFwfRdSsSXO49uxuD/AYmIC0DX2z6q6cK2HAgJK0dkED84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665013; c=relaxed/simple;
	bh=JSxkuwfLYvxeQ1LuAnv7Q4VDoNnLALsW6LY4/lPnNzs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSkKyr9BeG239pCtKaFBrHtnR/KMgvdR/0ayEv26piuaJ+2nWEHG+snPZ1VXlkf+KOYICNM13l0tbrbhNoRhfzMdQgY+mJFoAWRv1T1AbdwtJavtYzKD9nLVIo6lZ7+36JeHqSs+uBR2l19Vn1+1XyNJvQ9az53Uf4s/Od8KeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nmhZf4oF; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nmhZf4oF"
Date: Tue, 6 Jan 2026 10:03:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767665009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y5DxGXKwZLC7iNs7lrVUjR6LdQkjf/YFON8xRxVUjwU=;
	b=nmhZf4oFZ28U5LJ2uGUafdAuXsg+XobdQc/SB1hSDNClzsxJ9xyfJjcynmfOiQjuNvmQ4i
	+hONBNNnduVSQOm+4C6SodY3QQ7gW6lrHCvcV1O3V9dIWdIRGGR8RsvISCClu5EG6iaqli
	9Y4Jc4LIvsmTVrMecdQ3rezW9A/1T4Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aVxtG4eHkseIHov0@monica.localdomain>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
 <aVLhQQrYQ0T2rBeq@aurel32.net>
 <aVwj6xm28wG7IYtG@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwj6xm28wG7IYtG@aurel32.net>
X-Migadu-Flow: FLOW_OUT

On Mon, Jan 05, 2026 at 09:49:47PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-12-29 21:14, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2025-11-01 17:03, Ze Huang wrote:
> > > This patch series enables the DWC3 USB 3.0 host controller on the
> > > Spacemit K1 SoC, and enables it for the Banana Pi F3 board.
> > > 
> > > To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
> > > ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following
> > 
> > Note that the ComboPHY part got merged in the meantime.
> 
> The USB2 PHY part also got merged, so you might want to send a rebased 
> version against https://github.com/spacemit-com/linux k1/for-next
> 
> Regards
> Aurelien

Hi Aurelien,

Thanks for the heads-up and for testing the series.
I'll rebase the patches on top of the k1/for-next branch and send out a new
version shortly.

Thanks,
Ze Huang
