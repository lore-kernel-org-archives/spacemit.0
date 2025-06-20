Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1128DB53
	for <spacemit@lists.linux.dev>; Fri, 20 Jun 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428616; cv=none; b=CX13KuCp9xDF6ak5YJSfbheZNC4K7kD1mrdD2M5C0CqFH2eaqs+K1BO8nrvil+TFVff6gR7pz7f8X/dCDMJflJg3wyEOBK55tVP7l+Jlo5E4/4jrOcbZdSGTjW0mu32g4Ad24Ndy4hDf8lQRsWh3cafu/TeMlXcnIwyEhVKaszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428616; c=relaxed/simple;
	bh=TjGiW7i9K3ODr2HIBkdPJY5MK/H2xVSqGYS4lHnPSws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhq9iVQu3bGrGqBiNcNrhB+Aod5rH4aczb98fFke4+cBPTCoN282Zrd9DS8IAgf9rMItT8iRUTyhTkJjywB6Hm0jpeUTujYeMSRLXejZ1BGmOZt/buHCP7jy+VUqlaZAuXS8AKZzk9Ctml7gv7+x4inH0w/PwULhpEt2QVO00gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=X4irInEf; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="X4irInEf"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e75f30452so14358927b3.2
        for <spacemit@lists.linux.dev>; Fri, 20 Jun 2025 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428613; x=1751033413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+pLxQe4eVRAY0bh5C+6wdQnLVkUY9s5flt9lCy/28I=;
        b=X4irInEfBi1dzb4Z8g9dVpePXzuogDq+hC4+31SMzRm8g0XRHw1UhBZ4By/YSlBVdT
         52xrJyC/GfJXRo/XoQkHUkvuCT+NPCh3+dEfEEG/SEja/E4G0lH1r+pkJO2JSmHm436p
         Xk3yDbuVFk48HfOaWFZhLNtirsVQYofpYdMGXpzBDkhARfyjd6FvV8N+JgIGZ+/8A+v7
         HJTTjhtAwJSU9ktlhpFeiTmHtNxDdC0pWWaOuthGm9hC7DYjYUnQz0nBPZrCJLqQ0EFi
         uR65LM1xoS2JgHQB/mTOhFOQ32TNzet1r/mO7hwmKzMvB7NPwz3rf0RJ12abRyfizfhQ
         5VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428613; x=1751033413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+pLxQe4eVRAY0bh5C+6wdQnLVkUY9s5flt9lCy/28I=;
        b=req7hhH1UZsle5UlRpJpygaDKhjmr+NBQeYaRYaOznwnoSearZhiDadAKJFWkNXSks
         7qfM5sghgCj4HF5VeLEPT/6O1fZ2O9+/Hzn6/wgEDBgj9Pn2b06RgVrvBct7j1XeqWrh
         +BKle5QEV1HBiAXScGF5lhXKcNBwN39MOtqaS9yeSjG54/GG0EJOtn5T/HBIA5/YWCQg
         fOmDlTQB4MGUBxaVw9Sdn32fJyMdjYzcjNcVHLRpLDEIRmmHQoX3f82RSSCeWilx2R0A
         hHvrpcegu2U8mYqVryQNqj/aXQ0wSuEfEDlFO7MOjdASUJMr30sGdxj4Q5ETwk1/Wf40
         xP1g==
X-Forwarded-Encrypted: i=1; AJvYcCV2nTTJb1y3PrBbd+PMskUYkM9AJJGAxrpMt+1AjP8L8qJmtWldSDaibFpsvYxNcIUZNqlmrSrKbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1kIn1shtQ3iqqAJhKT0ym2zSiW/kJdmDbzkM8BtrtqYra/sz3
	fTz8CKt768OZ5bOlOclLHg69O1ka/AjqJTPbWgE3E2qmXhtvce9FDA4UzGahDh3oem/LT5g3Z1w
	TLX76yUQ2oPeuQhBMz4eM0HE/KsmlTuEjW9vUvnsofQ==
X-Gm-Gg: ASbGnct3FZmosYqTLvctn2Cv4JFGWmOpI5Bz69tTrobCZIWlsxZOYwa1IC/Ee6UgPcJ
	uDkbasfHTPJJIWnTfT6LGGe/l75tYcU6y4lmxDsZyV1+C/NhIMF1yCK0rZfNRtMMJW5kgg+zP3+
	jl7XIevTMZEqUwCsjnIOWT6NeYX2P0AsZP0xIe9y/jmAI=
X-Google-Smtp-Source: AGHT+IErXi1FXvWIfcINPIC2kRfbQWrm886Vqr6UoQFGwv43uK/gV2FH6lDzRfIyRbnRc7wq5KlIwUNxU6fp12JvFqM=
X-Received: by 2002:a05:690c:6b85:b0:710:f74b:61ab with SMTP id
 00721157ae682-712c63ed50amr38667807b3.9.1750428612962; Fri, 20 Jun 2025
 07:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org> <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
 <20250620105619-GYA165049@gentoo>
In-Reply-To: <20250620105619-GYA165049@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 20 Jun 2025 22:10:01 +0800
X-Gm-Features: AX0GCFv9n0bzPRKSi_EV7zEUnvgGx0rfSCuPNUTx-ocg18nmlNPk27cj-wTyKM8
Message-ID: <CAH1PCMZibCc-P7JQf4WyhkKuT607bWppKfKQ-7eo7-PyNGDAOg@mail.gmail.com>
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for K1
To: Yixun Lan <dlan@gentoo.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Alex Elder <elder@ieee.org>, 
	Ze Huang <huangze@whut.edu.cn>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 6:56=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Vivian, Alex,
>
> On 23:42 Thu 19 Jun     , Vivian Wang wrote:
> > Hi Alex,
> >
> > Thank you for your comments on this.
> >
> > On 6/19/25 23:11, Alex Elder wrote:
> > > On 6/17/25 12:21 AM, Vivian Wang wrote:
> > >> The SpacemiT K1 has various static translations of DMA accesses. Add
> > >> these as simple-bus nodes. Devices actually using these translation =
will
> > >> be added in later patches.
> > >>
> > >> The bus names are assigned according to consensus with SpacemiT [1].
> > >>
> > >> [1]
> > >> https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=3DdPgnANn_GqV=
fsGRS=3D+YhyJCw@mail.gmail.com/
> > >
> > > So what you include here very closely matches what Guodong
> > > said in the message above.  Yours differs from his proposal
> > > and that makes it hard to compare them.  I have a few comments
> > > on that below.
> > >
> > >> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > >> ---
> > >> This is my concrete proposal for representing DMA translations for
> > >> SpacemiT K1.
> > >
> > > It's worth acknowledging that this is derived from what Guodong
> > > proposed (it's not "your" proposal in that respect).  That said,
> > > yours is a more complete and "formal" RFP than what he wrote.
> > >
> > I had thought that since the addresses were already there in vendor's D=
T
> > [2], and the names were provided by SpacemiT, anything other than the
> > names was "well-known information". In retrospect, I should have made
> > the chain of information of this clearer and make it explicit that this
> > was based on Guodong's note.
> >
> > So, just to be clear, the information in my proposal is based on
> > Guodong's reply [1] (link the quoted text), which I had assumed, but no=
t
> > explicitly confirmed, was based on already addresses in SpacemiT's DT
> > and names provided by SpacemiT.
> >
> > [2]: https://github.com/spacemit-com/linux-k1x/blob/k1/arch/riscv/boot/=
dts/spacemit/k1-x.dtsi
> >
> > >> For context, memory on the SpacemiT K1 is split into two chunks:
> > >>
> > >> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
> > >> - 0x1_0000_0000 above: Rest of memory
> > >>
> > >> DMA-capable devices on the K1 all have access to the lower 2G of mem=
ory
> > >> through an identity mapping. However, for the upper region of memory=
,
> > >> each device falls under one of six different mappings. The mappings =
are
> > >> provided in this patch as simple-bus nodes that device nodes should =
be
> > >> added to.
> > >>
> > >> This patch is an RFC because it is not meant to be applied, or at le=
ast,
> > >> not certainly meant to be applied. Instead, this is an attempt to co=
me
> > >> to a consensus on how these bus nodes should look like.
> > >
> > > I think the above is what Krzysztof might not have seen.  Perhaps
> > > it could have been made more clear--maybe in the "main" description
> > > section (above the ---) or even the subject line.
> > >
> > Yeah, that's my mistake in organizing the paragraphs.
> >
> > >> More specifically, I propose that the process proceeds as follows:
> > >>
> > >> - Firstly, relevant parties agree on these bus nodes given here.
> > >> - After that, each time the first user of a bus appears, the series
> > >>    should include a patch to add the bus required for that driver.
> > >> - If a driver being submitted uses the same bus as another one that =
has
> > >>    been submitted but hasn't yet landed, it can depend on the bus pa=
tch
> > >>    from that previous series.
> > >
> > > Getting agreement is good, but otherwise this is basically
> > > the process Guodong was suggesting, right?
> >
> > Hmm, actually re-reading the discussion now, I realized that I may have
> > come to this late and missed out on some previous discussions, which
> > were alluded to in Yixun's messages. (This is again thread around link
> > [1] in quoted text.) This led me to believe that some of these were not
> > really agreed upon.
> >
> > I also realized I think one of the things I may have not yet made clear
> > is that I would like the bus node to be a *separate* patch. I think thi=
s
> > makes sense, because it's dealing with two different subsystems.
> >
> > >
> > >> For conventions regarding coding style, I propose that:
> > >>
> > >> - #address-cells and #size-cells are 2 for consistency
> > >> - These bus nodes are put at the end of /soc, inside /soc
> > >> - These bus nodes are sorted alphabetically, not in vendor's order
> > >> - Devices are added into *-bus nodes directly, not appended towards =
the
> > >>    end with a label reference
> > >
> > > I do like that you're trying to be more complete and explicit
> > > on what you think needs agreement on.
> > >
> > Being thorough was the main goal of this RFC. If there was previous
> > agreement on how dma-ranges should be done, I'm sorry for missing them,
> > but from my observations on the mailing list on how these ended up into
> > patches I really haven't seen much consistency. Maybe there was
> > misunderstanding, which I'm hoping to clear up.
> >
> > (Although see my paragraph above, maybe I haven't been thorough enough.=
)
> >
> > >> The K1 DMA translations are *not* interconnects, since they do not
> > >> provide any configuration capabilities.
> > >>
> > >> These bus nodes names and properties are provided compliant with
> > >> "simple-bus" bindings, and should pass "make dtbs_check".
> > >>
> > >> Remaining questions:
> > >>
> > >> - Should storage-bus exist? Or should drivers under it simply specif=
y
> > >>    32-bit DMA?
> > >
> > > Explicitly saying storage devices have one-to-one mapping
> > > seems informative, to me.
> sounds good to be explicit
>
> > >
> > >> ---
> > >>   arch/riscv/boot/dts/spacemit/k1.dtsi | 53
> > >> ++++++++++++++++++++++++++++++++++++
> > >>   1 file changed, 53 insertions(+)
> > >
> > > The short summary of what differs between your proposal
> > > and what Guodong said is:
> > > - You sort nodes alphabetically, Guodong did not
> > > - You dropped the unit address
> I'd agree with not adding unit number to the simple-bus
>
> > > - You dropped the comments he had, which indicated which
> > >   devices "belonged" to each mapping
> I went ahead and checked those comments, and found them all about
> devices under specific bus, I'm not strongly against adding the
> comments but feel it's kind of unnecessary, or even in worst cases,
> it may bring extra confusions.. on the other hand, you can always
> check  device nodes under the bus to find what's there.
>
> exmaple for dram4_range(vendor code)/dma_bus, the comments is
>  /* DMA controller, and users */
> what's is 'users'? still have to check the dts, and find them -
> uart, spi, i2c, qspi, hdmi, sounds..
>
> If people really want to add comments and help others to understand
> this patch, then I'd suggest to add explanation in commit message(better?=
)
> to fully describe all the busses, or why choose this name? -
>  storage/multimedia/pcie/camera/dma/network_bus
> pretty much in much high level perspective..
>
> > > - You added a compatible property to each ("simple-bus")
> > > - You added an explicit (empty) ranges property to each
> > > - You add #address-cells and #size-cells properties, both 2
> > > - Your dma-ranges properties are identical to Guodong's,
> > >   for all nodes
> I think those all above already exist in Guodong's version which
> align his idea
>
> > >
> > That was a good summary. Thanks!
> >
> > My main goal of organizing the bus this way is making it actually pass
> > "make dtbs_check". I'm not sure if Krzysztof still objects to my readin=
g
> > of simple-bus.yaml though.
> It would be great if DT maintainer can clarify, or give an ACK
>
> >
> > By the way, I don't think I will be making an RFC v2 of this. I think w=
e
> > should get everything sorted under this one thread.
> >
> Instead, from a SoC tree maintainer's perspective (whom taking care of
> merging all the dts files), I'd rather perfer an independent or
> separated patch for this given every party reached consesus, so we could
> get this patch merged first and early, instead of getting them distribute=
d all
> over in different series, IMO, separated patches brings more dedependenci=
es
> if more than two series require one bus and result in more merge conflict=
s..
> Besides, introducing new busses result in re-arrangement of previous node=
s,
> those like uart, i2c (even they have no DMA feature implemented currently=
)..
>

Hi Yixun,

So, here is my proposed plan: I will submit two patches. The first
patch will introduce the dma-bus node and move the relevant (uart0, uart2
..uart9) device nodes under it. The second patch will then add the pdma0
node itself. Please let me know if you have a different approach in mind.

Maybe you want to see an independent patchset with just the first patch? Th=
is
way it can be merged early without waiting for the pdma0 series.
Let me know. Thanks.

On a side note, you mentioned I2C. I searched for upstream I2C DTS nodes
for the K1 but couldn't find any. I checked the for-next/dt-for-next
branches in the spacemit-com/linux.git repository. Did I miss something?

BR,
Guodong


> >
>
> --
> Yixun Lan (dlan)
