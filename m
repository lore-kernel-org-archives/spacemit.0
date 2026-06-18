Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524B31F9AB
	for <spacemit@lists.linux.dev>; Thu, 18 Jun 2026 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766790; cv=none; b=mv3KZhH+16tuaPA2tARgwwQc0CZKElGL087ugmXKHOVxzPJvkDBjuy//EF6g0ljYrsHaBogn+rhaJuTrpkdpXDbSAu6vFpXtNraDz8hfVeY3+24lY2sEdo29JpBpdtLB2AVd+Cjz4KeQ2MOPPr1T8C6s26tgu0LcdNueQxYIv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766790; c=relaxed/simple;
	bh=Ez3ikU/x7+r9Ed6EbFv+aLj6wwrKN7k8sCEofzr3O8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g48BaRr2X9HdVw6Y7T7+ki7wwsO1HxCyeXdZcHSj67m2yb2uvOK9h8ujJhoixoduqH1gHN32u96UoEeT8wyu8DeU6Jam7gwI3fI3q8oNOYLtQgbRPEOwQBySP66cd6pD4PB1REBwjcrpvMOG9OKA8BbIW2Mwhb070wCyEJVWAkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7M9HEQB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7M9HEQB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8907f9f62aso302971a12.3
        for <spacemit@lists.linux.dev>; Thu, 18 Jun 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781766789; x=1782371589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=e7M9HEQB2CJ9AIeAXm5o6Yy51BysSyPYGPNtSiP7iYGaPh3cSpTfR+SG45OIxOT/ow
         jsewRgrQ/GyD9Usigk4D9PWOxl+geBtBMzuUNSCRqTO8te8zBBxZ0ob//Ojp9Oy2OXGS
         cExebcovJsR4Hmb/SBnZj/frWS7180EyRnNZ9oqDzo9Z3taUnLMem92Ln0aObzjoHzAu
         iBtiDB8UJQ3ITa2rYEun4upvOulwAu0LjXubNNGli4VylMU5RXmib0ABHfkURKZpkITX
         kgDbgxrKfQ8xJHnx3rwMrnFo7bBzpVQmVO4Y4XtkHBwZxB9Z8R4yAkAyIkB8e6XtNtW/
         KHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766789; x=1782371589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU/eD8zFijZYAE4C8J5GszRlhYqC9pFtYnLR1rm99qs=;
        b=Eg4Z8bQR9MZ6+VhmlA3c1lMDZswngZbycP1A12lhk6o+n0mc+Di+QI8zIdYWrpV2r+
         RJUvBhVcBzaqyffIzPDF/hQ+POlLetsYokK0nwL5sOMGdb7b4/czmHHWuNDq/qFIoODb
         NC7tnpIKooZCND9UexATC0xa7OoXWzCmNzUNGVbSaRz/lWaJu1GP3qGE9l+FFffIsAUA
         NpXpGW7M390b7vsDd6lRJ0th3CncxBdFQVdLwIhXjImjcQrpJM/BFsUSdSXEUaxIY1FW
         CTKT20dIZkgFRp6CmCzBehWRp+U1MrOj6cywaMDwhsxCf6sZXqj3vU6NIPfwEasQN85J
         7OeA==
X-Forwarded-Encrypted: i=1; AFNElJ85vKsUnthWWRHRZTPKQ6xY6m1+kFDpi2P3NFTEcioIkrWAC9I4KvDfKzxSh39u6oNA3WvmWnX6ZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwikUroElv+V8ZptM7aUvqJwkK2VKDi6ohBELS2hpDwT2otu0U9
	zNPOZ8uZQuUqoyQhbjv86mtGyPFZiZe4UuFAqkfcXAZ/VuS6Li6iSYiz
X-Gm-Gg: Acq92OEbzx2JfupXmup6xHB8GnpRaISy+dbkUgWpmmZA6B9LCS5x45XKKVB+8dbGn2V
	FWfUrh5Eia3G461+PNnHpM+V7QnLdXSlR5DE4vCqzpGhyXegltSMccGAhTpH+mgeAfW97HvoKFD
	02x/5EkkBOncPfN3Ox4spR7WZfY97Pr7IEkhV5HIVzCCQMjuKU8yfl3pcsQ+4w3DvS+5whf2oHE
	Ceqjsbcq3R4u369Kvv5TE094TTV6cMnYvpUu2eBUk8dWzQ/bZwRU0OtD+ddhHTdpp1EqJj5RmPd
	ZAn91P0O88fgBhMtDP+qEk/qc6kkns0mKK78ekCNpOhbfnBseKaZa3lQ1mMFknc/1CmBq8XKJoW
	Sl/XK+R0J2ZJcndzOlhO/eAvq6MCHgc0A/JzF2AqzAk7oF5V6WgxIzSS9cS547HNo
X-Received: by 2002:a05:6a20:c991:b0:3b4:65ac:e2e3 with SMTP id adf61e73a8af0-3b9e5b2381dmr3247768637.5.1781766788479;
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c889356266dsm3221211a12.6.2026.06.18.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:13:08 -0700 (PDT)
Date: Thu, 18 Jun 2026 15:12:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yixun Lan <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register
 definition
Message-ID: <ajOZnO_dFg20VnEc@inochi.infowork>
References: <20260618064143.1102179-1-inochiama@gmail.com>
 <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b39829d-92b4-4ffa-be0b-b2b0f857f58e@bootlin.com>

On Thu, Jun 18, 2026 at 09:03:21AM +0200, Maxime Chevallier wrote:
> Hi Inochi,
> 
> On 6/18/26 08:41, Inochi Amaoto wrote:
> > There register layout of the phy ctrl register has something wrong,
> > fix it to match the right layout
> > 
> > Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > index 223754cc5c79..6feffaa3ef3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> > @@ -18,10 +18,12 @@
> >  #include "stmmac_platform.h"
> >  
> >  /* ctrl register bits */
> > -#define CTRL_PHY_INTF_RGMII		BIT(3)
> > -#define CTRL_PHY_INTF_MII		BIT(4)
> > -#define CTRL_WAKE_IRQ_EN		BIT(9)
> > -#define CTRL_PHY_IRQ_EN			BIT(12)
> > +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> > +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> > +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> > +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> > +#define CTRL_PHY_IRQ_EN			BIT(9)
> > +#define CTRL_WAKE_IRQ_EN		BIT(12)
> 
> Looks like you're fixing 2 things there :
> 
>  -> Wake on Lan probably didn't work before, as the wake irq was apparently wrong.

I guess the vendor firmware and uboot may do something for it, 
but the irq is wrong actually.

>  -> The MII mode selection apparently also changes, but maybe you don't have a
>     MII board around to test this ?
> 

Actually, the only board of the K3 is the pico-itx board, and it only has
a RGMII phy. I even doube the spacemit vendor has not tested the MII phy
well....

> Is it possible you address these issues independently (i.e. split this in 2 patches) ?
> That way, if we ever revert one, we won't re-break the other thing that was broken.
> 
> 

Yes, it is fine for me to split it. I will send it in a few days.

Regards,
Inochi
