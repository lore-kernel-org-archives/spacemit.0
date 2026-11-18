Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794984877;
	b=cCw9Gbc1saawsABsqS0nwcnQi3sQuB05WILUwFm3ciZgOG2jaDIVLI2qCi4Fp1684VUG
	 rDeFsKF1HTFbPn8Jhvxe38soswXzxRH4UqkUi0lk4+QdKYTCIM/pmq1w2keFi5qU/fX6o
	 jxrjtSSkl0F4G5I8SMMdpaFtIhgus9WHDKSt4Mf0dD6wAxq3/63YupeDlSFC9ekzwHhEX
	 UlJ7Lr9VQe4WrjAPsf5tQiHXa2m2XSGCxAN3Qn8tdhqwp/WpR1MIKeXmf+ntTqVfomGip
	 1adnqVNH104pjJDQUNwj6mXW65DgC7zJpSptob9GssUnCaVlOuYB4ee0l0IVzZ3U3fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
	b=MPg2Qm9nFIYPtz4OR4cd6yrupycx2b1ImZXv6wop3uP1gizdl1yzI1bpSFRe1SJJZ1b6
	 xnjG2YqvmosnCiq3VDuO2gMxNltDNGm4nl/FX2KtM7RqhMSoUENbWcfU0UmZhRKqrcohV
	 5FhQMSkK0C2hIuLhSX3ynOhoEAjyPI2ZopwaZC4bIhU3UsdUdlBj488rZWRXYGz9w2Z9B
	 2F+ilgdv+wOgJlGVJn6oyajcO8LKBhR/aGvVHEBj2GNpMbIEVxFv+sTGv7zW+ubAxXlJp
	 ybIGIRvfZ/S1tJkIya1ZfXVLqTk25NP2rIzXcphn/G+k09k7qV+Ve+I26PY4fZQfphw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1boK50t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAE606A32C
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 06:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y1boK50t
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so928073a12.0
        for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 22:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794984875; cv=none;
        d=google.com; s=arc-20260327;
        b=pKCQ3W1p5xC4ufnEN7+vc4Cw0d8s6UJfuKx0mSSK40xP/6fqd75i9irdw+iI7I53k6
         oRu2OMdaaY5I1uNpiT9/IQD2UOZhsKMLr8+UIL4LfaHyt2QrFvfyTNsfvGj77kVG16e+
         raShHbHbs0bUvm7fJ4VwwObxo0z6EOAF2DZURfWML6nUWR9cxaCjDL0TPx9KB5WdsZZW
         qA02qPES+njq0geOQdMOFQKyxyLWgXWjgvuo04UPo4hTOuUEJKecDHvqdAip13V65LnI
         4fREIxbXQrUNfg7jI3u9BzulqXlEX86DNblv7weSkP9wYIFb1NvhJzC1WSro6dfBMYFB
         WRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        fh=mJ1jSxlRTxl1jp4fKKskStd9lbgyHn23+WAD6WCoB6M=;
        b=LWKtJJCf44GUBSYk1OKQiz3tNJZMhV6xbfnGs7clcPV2RIBQBtqfrDOoMOeepTO8m4
         GvabScIoLhjVTxcg1XKVWPS/4aOX0Wnfrw8XyE8KPMoE8GHcPPr5k5M2ar8AYEvKMdZf
         ESWH6YulXEdXdXEIRclHt0a8Af41QKwNccWHHW09ifLLvooiSntKH22cyo66fBZd2M1c
         4qdNTUg+D8++Vg4OuqiEgLXfnX6C9tUQRrxWiur1QXfLTLih3E7/NgN8RkkzBIhoGrKm
         Eh7e1s5Zktk/QXJdCuYHBvVn56uc+uuqRwDZRSQM10WXOdDnSRvgl/ixRMrgsubnTsEb
         U7cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794984875; x=1795589675; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        b=Y1boK50tOU3AKasibkcWg/ND+r5X3LjoTUCLZELjlzSaBwrk4nkpJeK11c2DWIP342
         gzoddBEr2ptfHeAqvEEANGCEiXicrguqPntKssyDXYzONcCF64+noFxe9XNB9p0NZFCe
         laTBq8iPEGIO62sFDXocrM5ynpB2TpYE5LHSqGtfQ2JQIoJNrMUGwc1aQIyYu0mXark/
         OMxzN7YzkaJ0gxu3QQwQMOBpYULNFBXgVlrhXbZt8BULIIOINg4YiR9D4VaoUF2l4Gwj
         iVYrPtz4WEdXlak4xOBFBFCduylsvfa0rPICPbW72OScx3nPDPPvUpBA9sq9IpfJBkyX
         FjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984875; x=1795589675;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        b=rGsh51zUEEKFjKgiqJM+lIgZgas0kYpuLInGcGIfmCOkbi2nSy9B0qAyCbnjjIfQJr
         45k4ABGIvyBwJcuYLFc3iVuAh/9lzXRpge1ZjoESDzJCs/UIW5pUp8uynRVl435GEzTT
         VGbIiyQlRLckWoWW25xGMQg86EmcXlncgDJ+MfnXvUHenpQxrQpla0wmifS7rbbdO39y
         5Vi12o2+llnYbNB0dbXmJr12zioCmTP5O7ykYYDwIktcuhg/f5yxAwWuTnD3xVg0U6wY
         CMQLDjsqP42qMCsyMjT6RI6xHh3aZF0T4cBuZXE+pCAgqYva+O/ef97KD9jPJjFG9AqG
         LnkA==
X-Forwarded-Encrypted: i=1; AL+hErHE3XB5iRzim2yioNhWCTRrWEozb/rPyae7L6DF25QQNYdvQHLAhp+R5dHXrEEoMaZlp7XLr6RuKQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/k+StdICRQzuIGSix/SC8wUz57oisZ+WNeXhPG9fSmS31GaLuh
	Xdh7+OWEiHdMh4S4MhCcj+Q2WOl6b4U9Sif0s2fAGyAa/3eGz8OpdB7lZczhimtOy/qUPL9Esa/
	BUif46YOl5LM+htqA9GVYiHImoLqAono=
X-Gm-Gg: AYBFou1MDbX14nZfiEIvgP+KtcyQRGoURMr+DaTV4AYzbd8uuVwYvlZCMsrozuhFFmr
	52s6QgB95ppMWx3K8XZ8kujbSS/eG8icsePvJU82BjAizKwawUaXKDqbZOab9XxJpb1MS6BMkEg
	P5IKmXVUDvnCP4GY6TCKGpcvtmTiV9E8tZuC6xUsuN88YqJH7P8qw3RpyP9d/fHbmXN8BIFFj1K
	H/9SGzkHAVTQtNUoEVo+MTF8ozzBmjxaEYLvmBquwmdAELQB6CygYa4B09anCsLkxfK9xfKz5xz
	vFguU89Vi41td/tmZubgDi8OnmTFAIYoVJLile4nU3N733FkQjtBdzf4U/ZcTsG8g7rXqBMYisd
	g3k5nphEynpr4R3KkYeeeVJqs5DcAHb6YW+GZGmt8BdkFBsFITdZqkWeP
X-Received: by 2002:a05:6402:501c:b0:6b7:d1a4:fe1b with SMTP id
 4fb4d7f45d1cf-6b88810c5f5mr1112459a12.43.1794984874478; Tue, 17 Nov 2026
 22:54:34 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avpN-gFOvTBAMY6G@venus> <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
 <avvnRkK9agPSdzac@aurel32.net> <CANAwSgSXP1bZVVrX71jfgi1iR9AY4TpM0pk07ke+oeLvcX1fEQ@mail.gmail.com>
 <avzUjsZzhky4krEV@aurel32.net>
In-Reply-To: <avzUjsZzhky4krEV@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 18 Nov 2026 12:24:21 +0530
X-Gm-Features: AclHuK9HKxBMC369hvmbX2XcXZTYgL0-Osg6H7GZAWz1CrH05BbQd5v0LX84zZk
Message-ID: <CANAwSgRm9dbAtr4J4Gry_kR6xWQTQ+T+EaJ0vGDMpKGUPZxojw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Anand Moon <linux.amoon@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Aurelien,

Thanks for testing. Your feedback helped me a lot.

On Wed, 18 Nov 2026 at 03:56, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-17 18:04, Anand Moon wrote:
> > Hi Aurelien,
> >
> > On Tue, 17 Nov 2026 at 11:04, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 2026-11-16 13:06, Anand Moon wrote:
> > > > Hi All,
> > > >
> > > > On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
> > > > <sebastian.reichel@collabora.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > > > > > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > > > > > to access the PMIC. However, these handlers run in an atomic notifier
> > > > > > context (specifically within an rcu_read_lock() critical section), while
> > > > > > the I2C-backed regmap uses a sleepable mutex.
> > > > > >
> > > > > > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > > > > > context switch in the RCU read-side critical section during shutdown on the
> > > > > > Banana Pi BPI-F3:
> > > > > >
> > > > > > [  563.803475] WARNING: suspicious RCU usage
> > > > > > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > > > > > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > > > > > ...
> > > > > > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > > > > > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > > > > > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > > > > >
> > > > > > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > > > > > in an atomic context. Preserve unrelated register bits through
> > > > > > read-modify-write operations and check for atomic I2C support before
> > > > > > registering the handlers.
> > > > > >
> > > > > > Obtain the I2C client from the parent device and verify that the adapter
> > > > > > supports atomic transfers before registering the handlers.
> > > > > >
> > > > > > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > > > > >
> > > > > > Assisted-by: LLM
> > > > > > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > > > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > > ---
> > > > >
> > > > > regmap runs i2c_transfer itself and thus also uses the atomic I2C
> > > > > transfers. The problem here is regmap itself. But instead of moving
> > > > > away from regmap, the atomic use case should be supported properly
> > > > > in regmap.
> > > > >
> > > >
> > > > On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
> > > > through the SBI System Reset (SRST) extension. Linux delegates these
> > > > operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
> > > > and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
> > > > for reboot, depending on the supported reset type.
> > > >
> > > > Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
> > > > on this platform, as it duplicates functionality already provided by firmware.
> > > >
> > > > While supporting atomic operations in regmap may be useful more generally,
> > > > it is not necessary to address this platform's shutdown and reboot requirements.
> > > >
> > > > I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
> > > > poweroff/reboot driver.
> > > >
> > > > OpenSBI commit which handles this extension
> > > >
> > > > d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
> > > > b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")
> > > >
> > > > Similarly, on the StarFive VisionFive 2, poweroff is handled by
> > > > OpenSBI through the
> > > > AXP15060 PMIC, so there is no need to register an additional poweroff
> > > > handler using
> > > > devm_register_power_off_handler().
> > > >
> > > > OpenSBI commit which handles this extension
> > > >
> > > > 568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
> > > > visionfive2 board")
> > > >
> > > > -----8<----------8<----------8<------
> > > > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > > > index 50df66de24e06..069259f7d7c15 100644
> > > > --- a/drivers/mfd/axp20x.c
> > > > +++ b/drivers/mfd/axp20x.c
> > > > @@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
> > > >                 return ret;
> > > >         }
> > > >
> > > > -       if (axp20x->variant != AXP288_ID)
> > > > -               devm_register_power_off_handler(axp20x->dev,
> > > > axp20x_power_off, axp20x);
> > > > +       /*
> > > > +        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
> > > > +        * Avoid accessing the I2C PMIC from the atomic poweroff path.
> > > > +        */
> > > > +       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
> > > > +                               of_machine_is_compatible("starfive,jh7110")))
> > > > +               devm_register_power_off_handler(axp20x->dev,
> > > > +                               axp20x_power_off, axp20x);
> > > >
> > > >         dev_info(axp20x->dev, "AXP20X driver loaded\n");
> > > >
> > > > Please let me know if this works on your board?
> > >
> > > Yes, that works, but I don't think this is the correct solution to
> > > disable here. Also this won't scale for future boards which might use a
> > > different existing PMIC driver with poweroff support and that will also
> > > need to be patched.
> > >
> > No changes needed over here, reboot and power-off priority will
> > work fine.
> > > As pointed out by Troy in an earlier mail, the real problem is the
> > > priority at which the handler is registers, 192 for the reset and -256
> > > for the poweroff one. I wonder if the SBI SRST extension should also
> > > register the poweroff one at 192. It seems it's about replacing the call
> > > to register_platform_power_off() by register_sys_off_handler(), which
> > > supports using a priority value. And maybe SYS_OFF_PRIO_FIRMWARE = 224
> > > should be used there instead of 192.
> > >
> > Thanks for your input; with the changes below.
> > It works fine on Spacemit k1 and Starfive Vision 2 for reboot and power-off.
> >
> >  arch/riscv/kernel/sbi.c | 51 +++++++++++++++++++++++++++++++----------
> >  1 file changed, 39 insertions(+), 12 deletions(-)
>
> Thanks for this patch. It sounds good overall, and it's always good to
> switch to the newest API.
>
> I have been able to test it successfully on VisionFive 2 and Banana-Pi
> F3. Please find a few comments below.
>
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index af1ccea222f1..32a3d2df9032 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -512,23 +512,55 @@ static void sbi_srst_reset(unsigned long type,
> > unsigned long reason)
> >                 __func__, type, reason);
> >  }
> >
> > -static int sbi_srst_reboot(struct notifier_block *this,
> > -                          unsigned long mode, void *cmd)
> > +static int sbi_srst_reboot(struct sys_off_data *data)
> >  {
> > -       sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> > +       sbi_srst_reset((reboot_mode == REBOOT_WARM ||
> > +                       reboot_mode == REBOOT_SOFT) ?
> >                        SBI_SRST_RESET_TYPE_WARM_REBOOT :
> >                        SBI_SRST_RESET_TYPE_COLD_REBOOT,
> >                        SBI_SRST_RESET_REASON_NONE);
> > +
> >         return NOTIFY_DONE;
> >  }
> >
> > -static struct notifier_block sbi_srst_reboot_nb;
> > -
> > -static void sbi_srst_power_off(void)
> > +static int sbi_srst_power_off(struct sys_off_data *data)
> >  {
> >         sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> >                        SBI_SRST_RESET_REASON_NONE);
> > +
> > +       return NOTIFY_DONE;
> > +}
> > +
> > +static bool srst_power_off;
> > +static bool sbi_srst_available;
>
> Not sure we want global variables for this, as they are not used anymore
> once the initialisation is done.
Correct, srst_power_off indicates whether SBI SRST poweroff is available,

The sbi_srst_available boolean flag indicates whether sbi_init () detected
the SBI System Reset (SRST) extension during early initialization.
It allows the deferred initcall to register the sys-off handlers only when SRST
is supported, avoiding a second extension probe.

Ok I will remove them.
> > +
> > +static int __init sbi_srst_sys_off_init(void)
> > +{
> > +       struct sys_off_handler *handler;
> > +
> > +       if (!sbi_srst_available)
> > +               return 0;
> > +
> > +       handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
> > +                                          SYS_OFF_PRIO_HIGH,
>
> I think you should use SYS_OFF_PRIO_FIRMWARE for both entry. It
> corresponds to the reboot provider.
Ok I will modify this.
>
> > +                                          sbi_srst_reboot, NULL);
> > +       if (IS_ERR(handler))
> > +               pr_warn("Failed to register SBI SRST restart handler: %ld\n",
> > +                       PTR_ERR(handler));
> > +
> > +       handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
> > +                                          SYS_OFF_PRIO_FIRMWARE,
> > +                                          sbi_srst_power_off, NULL);
> > +       if (IS_ERR(handler)) {
> > +               pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
> > +                       PTR_ERR(handler));
> > +       } else {
> > +               srst_power_off = true;
> > +       }
> > +
> > +       return 0;
> >  }
> > +device_initcall(sbi_srst_sys_off_init);
>
> Any reason to use a device_initcall as opposed to just calling the
> fuunction from the sbi_init function below? If so, please provide the
> reason in the commit message when submitting the final patch.
>
Initially, I called  register_sys_off_handler() directly from
sbi_init(), replacing
the existing register_restart_handler() and register_platform_power_off() calls.
However, the kernel failed to boot with this change.

The sbi_init() function runs during early RISC-V initialization,
before the kernel
memory allocator is fully initialized. Since register_sys_off_handler()
requires dynamic memory allocation, calling it at this stage is unsafe.

Moving the registration to a device_initcall() defers it until the
required initialization
has completed. I will document this in the next revision's commit message.
> >  /**
> >   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> > @@ -643,7 +675,6 @@ int sbi_debug_console_read(char *bytes, unsigned
> > int num_bytes)
> >
> >  void __init sbi_init(void)
> >  {
> > -       bool srst_power_off = false;
> >         int ret;
> >
> >         ret = sbi_get_spec_version();
> > @@ -677,11 +708,7 @@ void __init sbi_init(void)
> >                 if (sbi_spec_version >= sbi_mk_version(0, 3) &&
> >                     sbi_probe_extension(SBI_EXT_SRST)) {
> >                         pr_info("SBI SRST extension detected\n");
> > -                       register_platform_power_off(sbi_srst_power_off);
> > -                       srst_power_off = true;
> > -                       sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> > -                       sbi_srst_reboot_nb.priority = 192;
> > -                       register_restart_handler(&sbi_srst_reboot_nb);
> > +                       sbi_srst_available = true;
> >                 }
> >                 if (sbi_spec_version >= sbi_mk_version(2, 0) &&
> >                     sbi_probe_extension(SBI_EXT_DBCN) > 0) {
>
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
