Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C480211A05
	for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215321; cv=none; b=h4fG6P63hT7ntw2HNlJ1FUdFoWIjyHJJuHaYMOJ2/UvPptxi4jaiLhcMXXDbXOHZ4ICHlyEgJYKW196Gh+OWTa7RN0TBN/E/UW6OooNk+0YkTAl0cZgh4EAEdORhX1r6OwOBb3/45yKHy/LSX0/+GOU94Mlq8bwBCJMr3QUG3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215321; c=relaxed/simple;
	bh=e36jCuwQ2QXfz9PniRclSf5MCBQDfIokoAxRq3nPoAM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bA7Eg9qkgqpLMU95cR+RRjm/FsMBlJIZeJHJv11bdO3h3YxGGNK9j/U8Na7tySjs/oVOjrPqY8T51tCQfzIYviK+ooIelXwNKM/3SL3c+O0JuzHRlRR/zKipmFQbE0XhRuV2WXnJgtReHm5xClD9Wso6JbGKhsAc2U3ogQWRs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YkHNpDpZ; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YkHNpDpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1773215302;
	bh=qWgwB8j/M+E4gmyyhynMGAfBcceSPDvi0TFbAOKm01s=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=YkHNpDpZhYv5KdGY+K5b4J/gnz0fkOiryUAdjLmJRbwMv6g50CXVB7tbOinjDcvp7
	 vEeF6CqiYjahvq59yadBSPmsc9m3QL7MKlZeF53TMXkyMPJI6qxELCgNQ7iZTSXU11
	 OIk4QzjIxC4GC53c7+hKVjkTkyw5lvKBjR3VMRtg=
X-QQ-mid: zesmtpsz9t1773215295tb12a1a0e
X-QQ-Originating-IP: ldkFeB95AQ/Pqp2XqD3PI0/pyB/6365kIn1OTkLhfkU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 15:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5492583855199653968
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 15:48:13 +0800
Message-Id: <DGZSCZZTZXMI.15QP3KJ8LB61V@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yanko Kaneti" <yaneti@declera.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Aurelien Jarno" <aurelien@aurel32.net>
Cc: <linux-kernel@vger.kernel.org>, "Lee Jones" <lee@kernel.org>, "Sebastian
 Reichel" <sre@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "open
 list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <20251102230352.914421-3-aurelien@aurel32.net>
 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
 <aaC78FTN31QYaVg0@aurel32.net>
 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
 <aaS6xeKFZz06fb1_@aurel32.net> <aaXuWwyA5NzBZzlW@aurel32.net>
 <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
 <aadGw1fIlJyNNoum@aurel32.net>
 <DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com>
 <4ab8430161252ec778fabf7e9b68acf3645ed4c7.camel@declera.com>
In-Reply-To: <4ab8430161252ec778fabf7e9b68acf3645ed4c7.camel@declera.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NKHXOVLrVQ/NJgCxDSclCSxhrS/Db7ShNULoBMzWftF4h0jgi5doV9zY
	FnSk3uyyNqboSNo30VlRvjSk01cD7aVAU47PbgWi5AzyFvO59ndJkxnU93SvhJxKzs8t2l1
	wMCixgp58vYfP4Nzmq2/hl7CmU4981710kDzF1u0gcoZkeN0unssfFZDPmLJP6tnLHAdfbt
	KOzsm78ko9Ng6iCoOJMvSxG4tsSNbrErNQy9pVX6XZKKu7P1002UbBKsgy9ZTvX+zhn5680
	eipIq0L48MBIdtARkvp8oxgs66Hfa+Tu8GVYSwtWTx1jCnZBtO8NSYK42uII2qUVQCkuJAM
	9NOe81haGQlkgy4H5c6DDvAGrfJFlo7dcr8IQ7WywbQIXgD7oZ3GHs7SpXHo1ygBA2nMqVf
	fom1xC4qi7h8/O0uf3sUw9Fxn7dfbkZpYS+II2nQwTtwIi8bshIsuo0+baXIpeYDhyiEMH2
	9x0lPi2Mtjl+wLH/eNJRbLd4u/qC5FjTltne88nBj6MUQrGZ6VCqlitFHYNnLc8S0F3GA0J
	PyfwnpaAq4zCCucSJeHPW90/PIgDlzD57nCnj1Ytu8fO3dI/rFrcGZXGLyf6uZysGUmygcB
	ZcLqZ8VPMNsVTIxrcIFqZQ3Lbc+pmGgKy6bJb/42pBAIcJVUi8FIWSIvrW8eaUuT7Vh8tUQ
	T1UeTrrCaxCCd5z231TvILgsXJoeNW65gTCO9F4wieoA9X5NleEbA8lpclj2pZeVLAx+0wn
	WQh7qhK5ti9Uf+gb5HSm54dqld/jh21LgBqKM6uJbitmT/xCopZJ7aZmReL3SlQJFuKU9sY
	CYMkMkCyup6Z8XkF+anpqEgHFHiR6f26FZzDRjzwb4FclToEaI4sftee142BLddR9mluccG
	0x+syFvD3JXOYbGoMYu1QEW5bWUf7b0/M9Fca0ppND0ga9P0gsVWY8ZWqCLWmuxFLRit841
	lSI+95JiqUwTw7kq4qfNAwmsXxlLtFTQieAyTVFGPNvxg0SRbtZJtn46rl++Fc0qNGocbnT
	ezFSSleNKUZ83wWhy/mqZqBagnA6zsq6658TtR8yaew7juyTAFTgyza/zkClnyx0p8p1IXS
	wnNFrmBvn/xMdDtH0k2NA1XiQNUsAoIBa7smm0hi+mHVX3sJjkc2By3yaQnc2SnjA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On Wed Mar 11, 2026 at 3:08 PM CST, Yanko Kaneti wrote:
> On Wed, 2026-03-11 at 10:58 +0800, Troy Mitchell wrote:
>> On Wed Mar 4, 2026 at 4:38 AM CST, Aurelien Jarno wrote:
>>  Hi, Aurelien and Yanko,
>> > Hi,
>> >=20
>> > On 2026-03-02 22:34, Yanko Kaneti wrote:
>> > > Hello,
>> > >=20
>> > > On Mon, 2026-03-02 at 21:08 +0100, Aurelien Jarno wrote:
>> > > > On 2026-03-01 23:16, Aurelien Jarno wrote:
>> > > > > On 2026-02-27 13:29, Yanko Kaneti wrote:
>> > > > > > On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
>> > > > > > > Hi,
>> > > > > > >=20
>> > > > > > > On 2026-02-26 16:32, Yanko Kaneti wrote:
>> > > > > > > > Hello,
>> > > > > > > >=20
>> > > > > > > > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
>> > > > > > > > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip=
.
>> > > > > > > > >=20
>> > > > > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> > > > > > > > > ---
>> > > > > > > > > v5: no changes
>> > > > > > > > >=20
>> > > > > > > > >  drivers/mfd/simple-mfd-i2c.c | 1 +
>> > > > > > > > >  1 file changed, 1 insertion(+)
>> > > > > > > > >=20
>> > > > > > > > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/=
simple-mfd-i2c.c
>> > > > > > > > > index 0a607a1e3ca1d..542d378cdcd1f 100644
>> > > > > > > > > --- a/drivers/mfd/simple-mfd-i2c.c
>> > > > > > > > > +++ b/drivers/mfd/simple-mfd-i2c.c
>> > > > > > > > > @@ -99,6 +99,7 @@ static const struct regmap_config spac=
emit_p1_regmap_config =3D {
>> > > > > > > > >  };
>> > > > > > > > > =20
>> > > > > > > > >  static const struct mfd_cell spacemit_p1_cells[] =3D {
>> > > > > > > > > +	{ .name =3D "spacemit-p1-reboot", },
>> > > > > > > > >  	{ .name =3D "spacemit-p1-regulator", },
>> > > > > > > > >  	{ .name =3D "spacemit-p1-rtc", },
>> > > > > > > > >  };
>> > > > > > > >=20
>> > > > > > > > Perhaps its safe to merge this one now that everything P1 =
and I2C is
>> > > > > > > > already in linus tip ?
>> > > > > > >=20
>> > > > > > > Unfortunately, this patchset is still missing:
>> > > > > > > https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-6269=
42d94d91@linux.spacemit.com/
>> > > > > > >=20
>> > > > > > > This means the reboots work most of the time, but are not 10=
0% reliable,=20
>> > > > > > > and that's the reason why this patch got blocked from mergin=
g.
>> > > > > >=20
>> > > > > > I see. Thanks. Sounds to me like sometimes working compared to=
 never
>> > > > > > working is better , but anyway..
>> > > > >=20
>> > > > > I agree with that, but the decision was to hold on this patch un=
til the=20
>> > > > > I2C PIO part got merged.
>> > > > >=20
>> > > > > > FWIW  with this patch and the pio patcheset I get this rcu spl=
at on
>> > > > > > reboot (which is still working). Similar splat is there withou=
t the pio
>> > > > > > patcheset.
>> > > > >=20
>> > > > > I haven't been able to reproduce the issue here after 10+ reboot=
s on a=20
>> > > > > BPI-F3 board, but I tried the patch on top of 6.19. I'll try to =
build a=20
>> > > > > 7.0.0-rc2 kernel and report back.
>> > > >=20
>> > > > I have tried that, and I am still unable to reproduce the issue wi=
th a=20
>> > > > 7.0.0-rc2 kernel and a BPI-F3 board.
>> > >=20
>> > > I can still see it on every reboot (with the patches that allow rebo=
ot
>> > > to work). Do you have CONFIG_PREEMPT_RCU in your config ? its defaul=
t on
>> > > when anything PREEMPT is selected. In Fedora its CONFIG_PREEMPT_DYNA=
MIC
>> > > that flips it.
>> >=20
>> > Thanks for the hint, that option was not activated here, it's not the=
=20
>> > riscv64 defconfig. With it I am also able to reproduce the issue. I'll=
=20
>> > try to debug that and report back.
>> I have sent a patch to address this issue here[1].
>>=20
>> Could you please test it on your hardware when you have a chance?
>>=20
>>                         - Troy
>>=20
>> Link:
>> https://lore.kernel.org/all/20260311-v7-0-rc1-rv-dis-int-before-restart-=
v1-1-bc46b4351cac@linux.dev/ [1]
>
> Thanks Troy.=C2=A0Seem to fix the issue here.
> No splat and reboot still works OK on the R2S
Thank you and Aurelien for the test.

To be honest, I'm still not entirely sure if this is the right fix.
I=E2=80=99m curious why RISC-V doesn't disable interrupts during this task,
as ARM and PowerPC do.

I've sent this out with an RFC prefix and am looking forward to getting
some feedback from the community.

                                            - Troy
>
> - Yanko

