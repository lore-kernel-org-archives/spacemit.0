Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27471E885A;
	Mon,  5 Jan 2026 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646214; cv=none; b=O2Gc3KKYiffCOvdefCcFbTx+mAts+UJht0XeCgxCd7S8ghqgLqkmnbHtpH3leZI7pUElrQc+BpHCOHMbDbkKrfIsSWFDfM4GcPm+UKMSorlFJzFT20ILBr9XNd5h3/t8xK8KwwqKhOXcA+pGohJwgjaZ/9TENsQ/jgi7bFdbnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646214; c=relaxed/simple;
	bh=1m32XVTn9PTwbQZ19KkaXp3WJn3ox8LXqJA53gvvgME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3A/3WbC3+mPxTB6lCwNq1DtHVcO8FvmWQIB9Pa3IITPK72lcXP3bDeqJw3Ssu7z6xu3aBH66VnoGa4KUtwPHhq91hRunRx/bG1Hp7aNY4UslnJOVpFMqgDWX+5ncaYo1ck2pmtRWc4YBkTZSInvEahEp3w/bHu7Lb2pJkq9gOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=iMF6KrQb; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="iMF6KrQb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=xd6KbORI5C80YA+1rjUt8VpP88PP6HIea14IxMA48y8=; b=iMF6KrQb7WMVBPZK/fQsdq66U9
	F9guszU3ckpXtau7b48YHL1+HRcnXMC6rqjd5eWsJl0SNoZL7awZOKTmjXvNb5Cb+lZTi5iJD0yx9
	1JusZiFHKw3ZzSV8m13LMdU2zFIRbT39ZL2ejVorKsHCmLLSHWgVs37UzI2arqDu7Q5avI3wQRJWa
	ZcoZOVVZleDKPurxVNPTl0omEid0JIuAE9bRLOD0XBxu7plR4NAWhdGNZskOHBJtbY3tP+BlWewu1
	C+GWCJjEStGQuwHCHuZXZMbfhUHbQettgceYt0wPjhoETuoZ7PtZAOMBMEO1cXJo3X1GwCFU7nJaV
	atSe+Heg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vcrWO-0000000CcNc-1Gfx;
	Mon, 05 Jan 2026 21:49:48 +0100
Date: Mon, 5 Jan 2026 21:49:47 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Message-ID: <aVwj6xm28wG7IYtG@aurel32.net>
Mail-Followup-To: Ze Huang <huang.ze@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
 <aVLhQQrYQ0T2rBeq@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVLhQQrYQ0T2rBeq@aurel32.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-12-29 21:14, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-01 17:03, Ze Huang wrote:
> > This patch series enables the DWC3 USB 3.0 host controller on the
> > Spacemit K1 SoC, and enables it for the Banana Pi F3 board.
> > 
> > To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
> > ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following
> 
> Note that the ComboPHY part got merged in the meantime.

The USB2 PHY part also got merged, so you might want to send a rebased 
version against https://github.com/spacemit-com/linux k1/for-next

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
