Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDAD3AA4FC;
	Fri, 10 Apr 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855835; cv=none; b=VWZ+oMYMSCatM8qnemrH7up3Za3q4KgOCk5hTrNXBsqzrwAgD0weGVlz6fkOj3+glwKYUiak2Y1N3E1gWrlle5hTxe3L+eOTY/AtJuIWk8NJZOCF4+K7oU775MiQEQ5i0hrs0mCCXcCz+WpBY5FxpuBJTyysRq1LrRSymHlhfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855835; c=relaxed/simple;
	bh=vHbGiFiUjcEHBHLqM/1z32Dr2IAHJO0QcPk7Su0Xzso=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJXJjTG9XT9MF9sSqpAJDI8f96TakZBdQTV66c3nWroYEDmgDXWSv+WSmXJTXN+7EcoyhzeXTT+shYhGergzxLGyzTaljOW7Dvdxq0aq+uC7AfyAkGPHdEwsec4xUvkA2bHIbxVqInVnx5/C9Ld4m9OcPt9OB3MhQyvKCBvtZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=xNIcjJj+; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="xNIcjJj+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Content-Transfer-Encoding:Cc:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=nOeS013dZHZZVXOegg1RZdui9dG1gopKTyUnsxDAAeU=; b=xNIcjJj+VSiLTAwIpCW86zubwK
	PgnUZ0yNotW+zm0z9Vksvva1UPnOl7zAF/3LtMY3ZJKSSTdlVn/gf6XOe4NPxUC6vJ47DUwg3rWrQ
	MJs+vQB4WuFnnLy99tkOqwl/o9MwccSx92bbraqyqNBDOTR2N6IieVXa5JUHyQXbCnFHHOPhC7j1n
	4U1vlinRiQeaxAdMsGD/9O9T62GrzO7JGk4Crd1BgJx6yCjjctCIlJmKETdjZZSKBx3EWkMJWwLQY
	rutEhErZ4f0W2nEPQDLfkH7w49an2DwdyA6alJ77B+f8UPe+v8HyeG35gJu7wM6qmN5Ct9+JwGHqw
	BMT/CWBg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wBIcv-00000000wrk-3bkp;
	Fri, 10 Apr 2026 22:38:53 +0200
Date: Fri, 10 Apr 2026 22:38:53 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for
 the SpacemiT P1 chip
Message-ID: <adlf3br-bhakX0Dh@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260401165437.1048786-3-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401165437.1048786-3-aurelien@aurel32.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2026-04-01 18:50, Aurelien Jarno wrote:
> Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> Note that the spacemit-p1-reboot driver requires PIO support in the
> spacemit i2C driver [1]. This hasn't been merged despite being ready for
> weeks.

This just got merged and should be in 7.1 (it is currently in next).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
