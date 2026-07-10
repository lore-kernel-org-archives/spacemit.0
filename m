Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B03FADF2
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680954; cv=none; b=sF9i0Ym9s9pj+Marx6SE19j7HVYijmsFmtMPgWwzgP99o0FgC7W3wFZWrpD4NnYFXnyK513P6RI+M7FCcf9Kwo62PtNCjqmMJ+VgptVt/4F8SGK0MqONvgOuxTSfWuhRBr9+ngIN2zQpBL4jIFYU/gUW8YbKJbwy82KLXsFCTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680954; c=relaxed/simple;
	bh=xlSYGNU16W6S2PY8aAe6JeUMg8Dxgfqi4tAC4006wEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxAu/112S/4KQGNvYf590w+Ci9pjLReRKvGSyWbivz6SI5ykLJfByxxiVgmyqBNwtGlQ81pQjzFmDB9mpJbiKCyu5UAzrdbbqcSJ1WGP9qrIRUmAJQiEr7h1znzPGwrAMEeVqgiiGuR9TUul+OY0z1+w8ro9hUnF+IL4wtWsSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyWdxNBt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyWdxNBt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84864086bfeso672041b3a.1
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680952; x=1784285752; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYS+VjE3ZeLF6fGUZwF6+bVV7JweMtmHNhPsPcBJC0k=;
        b=FyWdxNBtVhCbK6RAp9dIN5vgRa2S6l6JlEgFKaqkyvTRr5yLw80U7JoEsP0ZRWEYD0
         5XK4QVzEbzBpImGpSpzVjAH2COsj8N0ACsUv3m9AwnosdWtAsJX4oGXTdo3ep3xLwE4G
         oWLwHEIbIWpRXt3+sZJtWjQjNCjVECphTV85pFPhqCU66Icm+Eb/hWzsOx0uDfIMQEbQ
         18HVZvR6/4JVx4/UYp/qIbkAdqi06Irh0Mv2dmLDmJXBovMZq75IhaX21uQGdB3QiwwY
         VpeuWZRk4T/4t3NdTzg5U2s+6V0eAvs98me9SgT7u+NW8nKv17XFvpXuFHZFQn3SkO38
         sujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680952; x=1784285752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYS+VjE3ZeLF6fGUZwF6+bVV7JweMtmHNhPsPcBJC0k=;
        b=kZ58YF9zRu7kE1paruq2Yx1ttOVcaaCWwjTbICoxtW5KWAxlpchxxmFIMCfwwJKWvd
         9mxO5vDSU30lsWFuDLpkb/SGzTCHtPeFHJHPDimDpj0KUET2eW+7GrrZhs2r2k6qVI65
         B/lcx5tF5vPaqalyET191muqtCzzjG4brkkRrSB5fHEe7o3cXUvbq6xC9TekvU7nyeZo
         7ur979r6nyxBhzAkWpbnvdBlSMSz+OCmUrDjJUAYLYhANB6zmmMAYkEwBSpDduX20a/U
         Ze4p+8duexLRoWXU3a2dDG6n4Vjtu3ddf2lIRrMBIeBog3G3163wpY6uuwTaTTw804GQ
         be9w==
X-Forwarded-Encrypted: i=1; AHgh+Rru0TqoQbPlCMedH2x/GMswW5dbaMGkSYNi2nMSua9HVJtUCm52SkCvZIV9kC1W0ZDy/01BOrxdXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTwygsJ13FSgPtqkeRga0CyD2V5pyMJb0BD5Kcwuq35LteL2Gk
	v34IXabiDDhwfapnSat12L8XdDG38wTy01zjWRkoMSYw02ZjRG3jYU4E
X-Gm-Gg: AfdE7clF/vnYVdOwKrPbwSTY5woI2xtlx2ZxADZ9fyLN2MNpIqI9/887jx/74nfthCl
	HEKoedI5JNSKuPVO0JVWplFxLLnTgGMMfpV3M0NDQn7nnQBF0q61jkm4Omly/7vONgfbdbWzUDw
	WvRhjq3tC6J8xRH00kbM9FidFnKWzwjf6p5sk0c53Ag0cNJVcbAS1z1pbh5MwoOSZGbolPvzpm7
	/AzRl8AKuZpowXV1X8bzmIYISuNfjUKGXzVka/YDLyAGpZOKsKamKxYhAKZvoirwX7fmG9aY9GO
	mxCbkV4GsS2hn0y9BHklMgtXQm+ugjslETTHfmarXzBjwd8lbAd8rIMKI8dg7KohabBQw2kg51v
	owl7InszBHqi99iOpxfWGabCuTriZxktRaH3lHc+OnXgvIVzlmpGtYsiaXzaV1yr3
X-Received: by 2002:a05:6a00:288f:b0:845:4888:74c5 with SMTP id d2e1a72fcca58-84842eecdafmr10377896b3a.23.1783680952357;
        Fri, 10 Jul 2026 03:55:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4986672a12.5.2026.07.10.03.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:55:51 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:55:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alDNlfb0_T9g-ATO@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alCoTEDUY8AO9OzD@ashevche-desk.local>

On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > >  struct k1_pcie {
> > > >  	struct dw_pcie pci;
> > > >  	const struct k1_pcie_device_data *data;
> > > > -	struct phy *phy;
> > > > +	struct phy **phy;
> > > 
> > > Should it be annotated by __counted_by_ptr() ?
> > 
> > Yes, I think it can, this is something I have missed.
> > 
> > > > +	unsigned int phy_count;
> > > 
> > > Ah, you allocate much more memory than possible PHYs... Can you redesign and
> > > use the above annotation?
> > 
> > IIRC use the annotation does not reduce this memory usage...
> 
> It's about how you allocate it, the code uses max_phy_count instead of
> phy_count.
> 
> > > >  	void __iomem *link;
> > > >  	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> > > >  	u32 pmu_off;
> > > 
> > > >  }
> 
> ...
> 
> > > > +	k1->phy_count = i;
> > > > +	if (k1->phy_count == 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	return 0;
> > > 
> > > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > > different 0 in this case.)
> > 
> > I guess you think 0 is a valid number? I can not understand what you thing
> > Assign this to 0 if there is no phy is fine to me, which shows there is 0
> > vaild phy found.
> 
> Isn't it already 0? Semantically code is wrong in a flow (not in the result).
> 

In fact it is already 0 here. But I am not understand why you thing is wrong.
Could you explain it in detail? (Maybe you think it is not good to return 
-EINVAL?)

> > > See also above. Do we have some PHY API that just counts provided PHYs?
> > > If not, that what you should probably add first, before this patch.
> > 
> > I have not found any api for this. But the actual problem is, how the api
> > is designed. I have checked both the array bulk api for reset and clock,
> > it seems like it is much more than this patch...
> 
> Yeah, I looked at the phy-core and I think it will be hard to implement.
> So, the idea is then is to reallocate the pointer each time you get a new PHY.
> In this case the phy_count will reflect the actual memory consumption by phy.
> 

Emmm, I think it is kind of buggy and not necessary. In most case
this array is not long actually, so allocate some pointer should be
fine and be an acceptable cost.

> ...
> 
> > > > +	for (i = 0; i < k1->phy_count; i++)
> > > 
> > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > 
> > 
> > I agree with the unsigned int, but I guess this definition is not
> > allowed in linux.
> 
> It's allowed and it's encouraged even by Linus. As long as iterator is local,
> use this syntax sugar and reduce its scope. It hardens the code.
> 

Could you give me a reference url to check, I have not found this
on the coding-style.
https://www.kernel.org/doc/html/latest/process/coding-style.html

> > > > +		phy_exit(k1->phy[i]);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
Inochi
