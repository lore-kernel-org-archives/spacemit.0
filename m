Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E32DB7A3;
	Mon, 11 May 2026 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482421; cv=none; b=TtZjGlguZbiuAcZnRhKWMOCq9q1JyIREx9bmWTN6QnLDj/bmfzBY9wbnis7+jJQRFfSz7exLo9frIBUGDyWb96AGN88UezA1zilj05TWSGEAq+q4yupsdWiEy2GKofekCwG8I99x0Ru69Yft35A52cYimI0z4w2IPVEnMbKA8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482421; c=relaxed/simple;
	bh=DjMG3RMfmbxoBubuz2Fi2Q/Ub+e33HEExV27VcejisM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYJK2GyILPPulKCh8kXqsKDCWUXVruy0pvbvSlRNbpDm5asPT86bBppPwdJrVPQ4RPZl+5/D338rmgxxLG8AQCctajQEs2qOamhZsdRqQdPi5guoeoJKQYHHyVKamD3DeGUsG4Nkk88KeQsK7m1N5lneWIGmVhWwtA7ZhvBztKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfljKWMf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfljKWMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B7AC2BCB0;
	Mon, 11 May 2026 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482420;
	bh=DjMG3RMfmbxoBubuz2Fi2Q/Ub+e33HEExV27VcejisM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfljKWMfzIYGg5m4revaXT1T0OgiHwpjz86MpbY7dDRYae7u8dqEB6bwayNymkvZ4
	 1kMDKOiltKAg+TW9HGPRdFT1qIhd+VU3YuQphVZWiN1J1J+JvigfSa57G/KYkk4KLB
	 IcCxp4HIcLX2lExmvzq0tLy3IOrMm2506Q4aOzalfEwuvdqcveuLQk7UmPVARTsPB2
	 OPmCc6/hBNaWdiKIyxO4cQRNyuIvEaEErg9Wp31A/1buH3GEcbdbcv9UYSbwPc8hTu
	 d2vhS+ylrxbyldYQCBiiCwOdZWS7p0bXSwnrvvx/G8yEQ8V7CVWD69lQ++TLIb1T2J
	 KNQ7w5PRvpcQw==
Date: Mon, 11 May 2026 06:53:38 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
Message-ID: <20260511065338-GKA3624147@kernel.org>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
 <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org>
 <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org>
 <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>

Hi Anand,

On 20:48 Sat 09 May     , Anand Moon wrote:
> Hi Yixun,
> 
> On Sat, 9 May 2026 at 17:48, Yixun Lan <dlan@kernel.org> wrote:
> >
> > Hi Anand,
> >
> > On 13:06 Fri 08 May     , Anand Moon wrote:
> > > Hi Yixun,
> > >
> > > Thanks for your review comments.
> > >
> > > On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> > > >
> > > > Hi Anand,
> > > >
> > > > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > > > > DC input. As per the schematics, vcc5v0_sys is the input power source
> > > > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > > > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > > > >
> > > > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > > > Cc: Ze Huang <huang.ze@linux.dev>
> > > > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > ---
> > > > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> > > > >  1 file changed, 12 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > index 5790d927b93d..9727ecdd9f6b 100644
> > > > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > > > >               regulator-always-on;
> > > > >       };
> > > > >
> > > > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > > > This will fall into the catogery of "non-controllable & serve no devices"
> > > > see similar comment for 'reg_dc_in' which raised by Krzysztof
> > > >
> > > > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/
> > > >
> > > > or should I ask, what's the real problem if regulator has no vin-supply?
> > >
> > > If the device tree is not configured with the correct power source it
> > > will affect performance.
> > >
> > Please elaborate, or provide enough evidence to prove this, because the
> > conclusion you gave here contradicts with what Krzysztof pointed out
> I don’t have the schematic for that board, so I skipped replying.
> 
No, you didn't answer my question, I was asking why "affect performance",
and you just gave me the opposite conclusion

Let me elaborate, the reg_vcc5v0_sys is a regulator which has no software
or GPIO control, so no need software control from kernel/driver perspective,
which also mean it will be automatically enabled from hardware perspective
once the board power up - "non-controllable" in Krzysztof's reply

the reg_vcc5v0_sys currently only serve as vin for other regulator which
is not a device (e.g not USB, PCIe, eMMC..) - "serve no devices" in
Krzysztof's reply..

and by introducing reg_vcc5v0_sys, kernel driver need to do additional
work to go through probe procedure and register the regulator device,
consumer depend on it need to wait, this will hurt performance, slow
down system boot and even consume more memory..

By dropping reg_vcc5v0_sys, it will result as a stripped power source
tree, this is only downside I can see, but doesn't really hurt..

> Please refer to the POWER TREE diagram, which provides a clear
> visualization of the power sources.
> 
> This board accepts two primary power sources: a 12 V DC input and USB
> Type‑C power.
> From the schematic’s power tree (page 4):
> 
> Type‑C → DC_IN→ SY8386J (Uxxx) → PI PMIC
> 
> According to the block diagram, the SY8386J regulator IC is
> responsible for generating the VCC5V0_SYS rail  VCC4V0_SYS (see page
> 13).
> 
> USBVBUS → SY8386J → VCC5V0_SYS
> USBVBUS → SY8386J → VCC4V0_SYS
> 
> USBVBUS ( TypeC port) --> DC_IN--> 12V
> 
> In this design, the SY8386J operates as a step‑down converter, supplying
> both VCC4V0_SYS and VCC5V0_SYS rails and P! PMIC.
> 
> SY8386 is a high-efficiency synchronous step-down DC/DC regulator
> capable of delivering up to 6A with wide input voltage support and multiple
> protection features.
> Datasheet [1] https://datasheet4u.com/download_new.php?id=1604744
so right, SY8386 is a passive device which need no software control,
non-controllable..

> 
> I have tried to elaborate as clearly as I can.
> >
> > > > Any probe failure or something bad happen? (besides /sys/../regulator_summay)
> > >
> > > Not really; the regulator summary just confirms the PMIC used the
> > > correct power source.
> > > with te device ip blocks.
> > >
> > then I see it's unnecessary to add this
> >
> > > Bananapi F3 schematics.
> > > [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
> > > (page 24)
> > >
> > > Please check the shematics VCC5V0_SYS page 4
> > > VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> > >
> > > Please check the shematics VCC5V0_SYS page 24
> > > VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> > > which is enabled by USB3_PWREN (gpio pin)>
> > >
> > > Plese check power tree page 4
> > > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> > >
> > > So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.
> > >
> > This is not what I ask..
> Opps, I tried, but I wasn’t able to clearly elaborate on how the power sources
> are distributed across the various peripherals.

Hope I make it clear this time..

-- 
Yixun Lan (dlan)
