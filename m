Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEBA369207
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783834931; cv=none; b=BzeeNCrkHPIS/hjpHGKpO8Wn5sqp6ZCpIP+MmA/RDmepj9t+a1gydXXvGi1QVEcZcWG38wDrhZRGHCTZk334UZa2qEC/iS9b9t+1ndiPwh8GGl/HYh2buEgf9r54Ohq+olujCLf2FKawzWnngrOB8en+14ZaGn+7YipVh21nNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783834931; c=relaxed/simple;
	bh=nlR3zh/p1mRq+F3TPAsXvl1Jqlr9oLfFdqFjFZlqsJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHPnG2/bgMpR7hlQKq7rteS+sXpHhQUS3kf2KeXo6rI3XvGrzwpz4dHAaRGY3UaAvNXOWZQkeaz81/ZUvcyyi5VN1ajUleDd57kTQabok5siLpdgxVmDcXHPouL4uG0Of0BakTLI6wKm5nImm/9he2pFUhypqGqdUNny6nBXp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWIrK8I9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWIrK8I9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848882fdb18so1219017b3a.0
        for <spacemit@lists.linux.dev>; Sat, 11 Jul 2026 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783834929; x=1784439729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FaLvu9plWauuInWbH6Nm3IcDF3YBj3kM6gVC9OQY//0=;
        b=eWIrK8I99DsGoJnnRag7rrGP2O/mvIdoSEQgrO9abqkDv1JiOO5htG96TvOfzRzA2P
         JvNj5nQRbVuNZSQ0v6x7pFmkL5z7vGmgNtVaMNzxEejWQHJsgprbgJlm0Dk5AN90bCzg
         WjwT2BsdzKiDbQGxT/0ZjZa3UTFteL/nsS/OjLWCpR5T4FLai4u8FgpRQqBG58q3vgIS
         R9hAPBGaVE/C+8mlfWpzbZw/2c+lRYhTxhNzFJfQj5JdTNvsC0bS3p3avav8XaPXesgB
         hqLpas2M8nHR1uliLfmOn+Co7Q6CHAznMZoMqslSLZINSZfuk8f3Plom9DikL1O3Jaqb
         2aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783834929; x=1784439729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaLvu9plWauuInWbH6Nm3IcDF3YBj3kM6gVC9OQY//0=;
        b=Vn/fDHpPvTfyT905yylGIeOys05t3wLZk6F5vW9fhpR19rDSGUcTqCRf+tLHTGjv3V
         0gxCNYFK6QfIBteZxTq6culvHaK4zgj2k1NGDdg+Sr/ieaAUz1LTDX7UTsJIYKPKmZqY
         wKEDyzzD2YWy+z9kQlpRZA1QUUzt8u6wkdGftxZWgAxXkcaaaDKoYGKg+j7tudakGkel
         5dOzDoKuBXAkOn1WTGylU4eRfImdpz6i6ofr1I6PIi8H1q46Ka55eC3p7ZkgoycKtwx2
         dmIc6uL+iyv4TOaPzwtx2LPF9TwTrhznqeDQ6M47WyPguVhJ9BZg6fp0DybmJn15Yk5B
         JRkA==
X-Forwarded-Encrypted: i=1; AHgh+RogfRc9Wvvkfruhh/2cFnPivRo8wXsRo1bELCFIFKZ4KAWnWA+AI3TqZCXiwTudlesaj1VmwNNB7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW7n52cKWt2fH6qF1wZZavWCw3JQLBzUWtasNI4TxfhUkiO3yh
	eS8ebxekJ6sPFT8zH+hkcJMIuFNitVgAkvNYzE0r8rxJcLEFVYdhgNMO2kyHC0PB
X-Gm-Gg: AfdE7ckA4tXge//jRQaEJGQ/vPOUjz30k+dkaQm9nctBmQE36wvzoTdmCIcy1ISDX5U
	qBfeHHhE8EKkPCjp0z6LxD2vzkWnHmNNB3ebYBpKPEEkKMRy0bicY74l5lwCGC/vag9uonkEChu
	mO2i6gW4QD3WbYpgZVygWofoFx1zCgNjGLKcnePdlAGmfpSt2j+194h4yO6n0VNYo0Xz95O9Nru
	IDrlpkKteLBW81CqV4WLgwu9enPGGj9HP2H/TCfcpxVVzdz3wwm28rm2DUQSKpbyhxRBINYs7yz
	+1agtN8fw4cFFX9dBsQLnnOMhLgH9J/Nt0g/GAsvv22W6IrCHeisgDCHRFmeUqbzXERsoDLJ/0m
	f4jfsJbIeRTXJQ0sxn8XVvIf2aCbE1t+fVWfbd1aGL3T94Hy0e10Liq6n+NLNQ6e+
X-Received: by 2002:a05:6a00:4487:b0:842:3a3b:d6e7 with SMTP id d2e1a72fcca58-8488965bcf6mr4272160b3a.23.1783834929207;
        Sat, 11 Jul 2026 22:42:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a15e36158sm691343b3a.47.2026.07.11.22.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:42:08 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:41:25 +0800
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
Message-ID: <alMmkHrfgWoN8RqS@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
 <alDNlfb0_T9g-ATO@inochi.infowork>
 <alI6ml4xQboFOgxG@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alI6ml4xQboFOgxG@ashevche-desk.local>

On Sat, Jul 11, 2026 at 03:44:10PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 06:55:10PM +0800, Inochi Amaoto wrote:
> > On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > > > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > > > +	k1->phy_count = i;
> > > > > > +	if (k1->phy_count == 0)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	return 0;
> > > > > 
> > > > > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > > > > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > > > > different 0 in this case.)
> > > > 
> > > > I guess you think 0 is a valid number? I can not understand what you thing
> > > > Assign this to 0 if there is no phy is fine to me, which shows there is 0
> > > > vaild phy found.
> > > 
> > > Isn't it already 0? Semantically code is wrong in a flow (not in the result).
> > 
> > In fact it is already 0 here. But I am not understand why you thing is wrong.
> > Could you explain it in detail? (Maybe you think it is not good to return 
> > -EINVAL?)
> 
> You rewrite 0 by 0, but the fact of the rewriting is inaccuracy.
> We should not rewrite the default (whatever it is) with 0 count
> as semantically they are different cases. The rule of thumb, we
> don't assign values in case of errors, we leave them as is and
> it's user / caller responsibility to assign the default and handle
> errors properly. This is simple layering violation.
> 
> Your code should be
> 
> 	if (i == 0)
> 		return -EINVAL;
> 
> 	k1->phy_count = i;
> 	return 0;
> 

Good, I understand it. Thanks.


> > > > > See also above. Do we have some PHY API that just counts provided PHYs?
> > > > > If not, that what you should probably add first, before this patch.
> > > > 
> > > > I have not found any api for this. But the actual problem is, how the api
> > > > is designed. I have checked both the array bulk api for reset and clock,
> > > > it seems like it is much more than this patch...
> > > 
> > > Yeah, I looked at the phy-core and I think it will be hard to implement.
> > > So, the idea is then is to reallocate the pointer each time you get a new PHY.
> > > In this case the phy_count will reflect the actual memory consumption by phy.
> > 
> > Emmm, I think it is kind of buggy and not necessary. In most case
> > this array is not long actually, so allocate some pointer should be
> > fine and be an acceptable cost.
> 
> Then the counted_by will be incorrect as it may access valid memory, but
> unused by the driver.
> 

After some search I found a requirement in GCC patch:
https://gcc.gnu.org/pipermail/gcc-patches/2024-May/653123.html

It seems like the array can have more elements than the counter.
Some I guess the reallocation is not necessary and the counter
is still correct. Correct me if I am wrong.

> ...
> 
> > > > > > +	for (i = 0; i < k1->phy_count; i++)
> > > > > 
> > > > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > > > 
> > > > 
> > > > I agree with the unsigned int, but I guess this definition is not
> > > > allowed in linux.
> > > 
> > > It's allowed and it's encouraged even by Linus. As long as iterator is local,
> > > use this syntax sugar and reduce its scope. It hardens the code.
> > 
> > Could you give me a reference url to check,
> 
> Sure, there are two (one for integers and one for pointers)
> https://lore.kernel.org/lkml/CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com/
> https://lore.kernel.org/lkml/CAHk-=wgy8p4is8ApEQCT5NS7XFb+NXeo-TKz7jRRZVksLLBSrQ@mail.gmail.com/
> 
> > I have not found this on the coding-style.
> > https://www.kernel.org/doc/html/latest/process/coding-style.html
> 
> Feel free to update the documentation.
> 

Good to know thanks.

> > > > > > +		phy_exit(k1->phy[i]);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Regards,
Inochi
