Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1560B1E1DF1
	for <spacemit@lists.linux.dev>; Mon, 16 Jun 2025 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055647; cv=none; b=i97+7Nu9N3pCC7wnPga0/HZWDcPVwzZ+scQN4lrZNVJiKyeG9jeaEDaDJwS7DyOj+4r0KCLoofB91Cy4WUrCS+I3c6Qm3MVMN+UuvJXYjgGKlPCWG+61ABvyUuPaJidyZUTOM4CyexR4RojqMeWmV9/xcNhR+TzMiiYJtESciFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055647; c=relaxed/simple;
	bh=awRmJsvDQMfQhTEvVJL9wh2SPLV5UZFK4UZQ8MfiOWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrOc+2uAUKUVtuG5/wmNbinsMzuXnz7uC3ymAKJxeLXRlCKfaQUeaPeobkXkxOy8En80aphdvSKgH9Awkvl4soVRy3+JdgEDHnVL0BGq0TGlU8XEElSsQEV822dr7MhvavFucOM1TBExI/77Oy/PAauyxOjftNJH+1YAMk0grF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HXYee8EJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HXYee8EJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VreY7vwdfbnY43YQuZ8tmmMfYatLVGTYphJA07D57n0=; b=HXYee8EJsUuQvF0URuDLGg086h
	SnAnFNwakfQlbI1lRghIWcyofnzQZ/GrOR5lCW1YgzV8Bcj7b6/ja2mbAKKSluskglLR/pxMNmEOM
	KircGnHZ5CmoqdJHmaD4IWW5ZdFMUK3UrGwRRYiQOK4f0p9A0IQ+J/ygDWw149VHf86b51xJkQHia
	wF9jnzO/2Jb85Iv/1jCUILiyzrQczA5C7GlO0jcyiIN8SU791XVij/8xTpEwW5jFPHHyBFy3WOxcD
	Dt+nBADyJTqcq0ZToW27s0qoz1f83nZCP6WFO8s1oJGug/E0O327uIe9ruwxc7rWyWv7ksGkdYVja
	dskbDnxA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48550)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uR3PQ-0003HC-07;
	Mon, 16 Jun 2025 07:33:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uR3PI-0004ak-2W;
	Mon, 16 Jun 2025 07:33:24 +0100
Date: Mon, 16 Jun 2025 07:33:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Vivian Wang <uwu@dram.page>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/4] net: spacemit: Add K1 Ethernet MAC
Message-ID: <aE-6tPMpMfRD1Zgu@shell.armlinux.org.uk>
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
 <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jun 13, 2025 at 10:15:08AM +0800, Vivian Wang wrote:
> +config SPACEMIT_K1_EMAC
> +	tristate "SpacemiT K1 Ethernet MAC driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on MFD_SYSCON
> +	depends on OF
> +	default m if ARCH_SPACEMIT
> +	select PHYLIB

This driver uses phylib...

> +#include <linux/phy.h>
> +#include <linux/phylink.h>

but includes phylink's header file? Does it use anything from this
header?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
