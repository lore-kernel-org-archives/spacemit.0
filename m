Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA633D5662
	for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240745; cv=none; b=k/hyY30uKZpq9ZmFOJfzstQJm3jJ96QWSSlxW84fcH1/UtGwPi/yiHTGEx/DyLDhtqXnwJQMI1X3A76XopIm/g0pcu9oB0odCWGeJaRCG3aMt1BDGJ6jckPTGYfH6ZjKpwR4CyLvUqt/krTOxbgb13387AAdWIzBvuusPyoIP1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240745; c=relaxed/simple;
	bh=HYT89RawmmfsAb7e1+1QSfqswIp/WGL73lEA1fxR5Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avKGYliFRl0Gn128ovtvSHFdp6AR40Y8C136BOyYmlcCboZX2NbK5mM1LJTiLAm5jlEY5zbUw90Sz5+++o+tJJosQmJ2uYuBkftacqvuDAZ29ql0djYeJtKhN5AZCPASMA2W0wvCW46T1tqOjopFRWxa9/khIDqdujw1kg6XOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfMDm9Wj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfMDm9Wj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2401130a12.1
        for <spacemit@lists.linux.dev>; Thu, 16 Jul 2026 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240743; x=1784845543; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=UfMDm9WjXuWiHu3oSjkNb3h0iCK9Gb7mG2x5VSIKbi56JiKdPtRHY3q4n+W70MoZRH
         bD4/RQZDdekh9uZtEhjH+AtRmToOIhNxFuVC6CHgTHtIzdHAlVWr9YWkQ2ljQYaVewDD
         0Qex913c0x0dCXOeNqgCdtmrjh2bHdqjblK/xHRVq/4TfSl6GcOjLQm+VfdBJ3aElamb
         Rn3k67hBHu/SRpxec3B8nqAuvHmXApxh/jT0KMeDd/cM0GNarSoPUmqrzrDiU0hf4ejE
         +48SI/teWiOP9OlYJeDezqIUYnj5p+OUO5GDG17EV211e0AZp/S4btTPdQBXDLZhVonl
         96gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240743; x=1784845543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=UeWzRWEouvqpGidttUq30wRJrlAZUVYskuujWn1CCcI7xy8UwSf+32aqQ59Qw+nso+
         vSbYyei01BdGiMD5hsqFYruGfYhVS9bl6xRJCG5H3BDlvWjCzoM0Syr0nDF4wwcH/4U+
         AlC+Kb30d4YS+6DxZMLME1ufae9vJG33SMstrbHJNcuvAHDVWeRWOVyVB18OQoCyOFbd
         EK3q5+iJBb1m57dqGxv+rTJoKCn6Qdsp+pC619DAYcGbplyCL9092unbyYT8aeklJT2O
         1vn+TXMwT1om+N9q8wo/59k/Tn7+cYy6qLgCptVLEJ4cwY0DpA/YNRx+LNMT5Er+aK6k
         tixA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7EJpXQmfmQGbGBLLUTWM7pT85tyGVPNTGZx7NlSExEBanSTW+WtGZHqy3zKtH44DyGdnAe+A1tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaBCkN/X3RJ79ml9HUOplH1/lmEQn6uyGaMrPciz6TcR9syIB4
	80DwnCMalLz7bkbrpBAwi4V2Sbo2Rl+0oHhPpmIkrr44cg267bmPkHBR/H5/MEgsO88=
X-Gm-Gg: AfdE7ckHuTCXnUHgRlmMjbjikU2L06a8HakISpEXULB/IxFKcNK5CDI+pef4sKl/b6j
	gnQXdKk6Qp2R6Smi3xYqoAHgAQU38uqt9BuCl2j/FUC6noSZKXQl34XdCE35Fd2QtG3rvzx291O
	Mq1xeDQnEMctKq9Cnpre3oxuz7yXkFzIYZdoSQBF+N5wPTrcgyWkxNoT2yDNyD+qcqjWAHPXKqf
	dpVbJeHzb/dYTTUSmYvxh13s1LXcp+lZR8fwkLDgExFK0R1rRAmlYqD1rOrc8lyV6RHtBWquBSC
	26WasETqpYIjieHF2SwQBSk0262fv1MwA1+JBheQxV++h4MLlR6AUG2TpD2ABZREvYKOL6cZKMh
	pKq+aBjd88WwOdlayGmlUgLOOPKA0ye5UhJpzv2otvM5OVKHLDkN8GQ==
X-Received: by 2002:a05:6a20:2446:b0:3c3:9eca:aee0 with SMTP id adf61e73a8af0-3c3a5d428a4mr1081625637.48.1784240743152;
        Thu, 16 Jul 2026 15:25:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd403a7f7sm13722999c88.0.2026.07.16.15.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:25:42 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:24:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <allaAnK4nfRSkacc@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
 <alRmA-X4xbQ9zPFn@inochi.infowork>
 <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>

On Mon, Jul 13, 2026 at 10:04:09AM -0500, Anirudh Srinivasan wrote:
> Hi Inochi,
> 
> On Sun, Jul 12, 2026 at 11:19 PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> > > Hi Inochi,
> > >
> > > On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > > > Add all PCIe device node for Spacemit K3.
> > > >
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> > > >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> > > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
> > > >  3 files changed, 266 insertions(+)
> > > >
> > >
> > > I see some warnings printed during probe
> > >
> > > [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22
> > >
> > > [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> > >
> >
> > This is an expected error because the driver does not support INTx
> > but the hardware claims it supports. Since the vendor does not want
> > to support it, so there is no way for the upstreamer to add this.
> 
> Are you saying that the hardware advertises support for INTx, but
> spacemit hasn't provided a driver that uses it?
> 
> Is there a way to let the driver know to not try setting up legacy
> interrupts then? It seems like it's trying to do that now, and failing
> to find interrupts node in the DT.
> 

IIRC it is hard to do this, this is more like a quirk for the spacemit
PCIe controllers.

Regards,
Inochi

> >
> > > I see that all the 3 rc nodes are missing an interrupts node and an
> > > interrupt parent (saplic). The vendor DT seems to have this. Not sure if
> > > this is related.
> > >
> > > The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> > > like the card is trying to request 32 bit DMA addresses and we're
> > > failing cause we have 64 bit memory only.
> > > The vendor kernel seems to have a patch to enable 36 bit DMA in
> > > the rtw89 driver. That'll probably fix this.
> > >
> >
> > This warning is also found on my test, it is not related to
> > the PCIe driver, but a lack of the RTL phy driver. :(
> >
> > You may also noticed a bad performance on this 10G ethernet,
> > it is caused by the single queue used by the RTL driver.
> > IIRC, even 9800 X3D can not achieve the max speed.
> 
> I don't have the ability to test the 10G NIC unfortunately :(
> 
> Regards
> Anirudh Srinivasan
> 
> >
> > Regards,
> > Inochi
> >
