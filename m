Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7FB4D2EE0
	for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829931; cv=none; b=UcReW1Fg6cyV1x26cgnmRPpRS6eDq48RPTcflpzEgh/CtljCXEUlDtOG31R1c4los/OA8lFB3hDJWfCcntl5MKRybdbPWpUrapE4S3d/SjefZX8PAyxmoqmrEDZzlyHNIv8bGTacyG5vCgbCrRK4g0A6wwNhbrM0ihqfeFf4FlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829931; c=relaxed/simple;
	bh=H3ajQd7wm1bFogX14K0eYfOdNs6MQ8yHjBdXJ/cawUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fx+oIF2zip8STQm4oVsoMIujvKntd6lXxQjlcizrVixD5RJOU2JnQRTILB3ZIo673X+pzfVw9PNiv82KzwhA/QOlxOrN6MkMn1viBeQ777+AejOfEd83zYjZmdq/Ubj2VjALa+JCDW8oG0cP0wq0FPReyy77onIqp3HzEK2UJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zb9CfTSs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zb9CfTSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791829928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
	b=Zb9CfTSs0i3e6oihYEcyFZF3C+/aQQQKmrZz2FT4ho35XwTvVg4RDlQcZJ2EDebcM0aZWb
	w6uaGxuB15x8lf0K/9ktfQLwJWuv739TbAACa7dyhTIzp1P0jNPiJh5PO4AkDvctOlwvjK
	NekjD7PmpN/MOlvQjlCMaiyan5vJ5mU=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-jCqffShDMZyGx73S2BQP5A-1; Mon, 12 Oct 2026 18:32:07 +0000
X-MC-Unique: jCqffShDMZyGx73S2BQP5A-1
X-Mimecast-MFC-AGG-ID: jCqffShDMZyGx73S2BQP5A_1791829927
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d6d5ea0757so2814752e0c.1
        for <spacemit@lists.linux.dev>; Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829927; x=1792434727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=hXJxidGLK9TM4XOqeaOpL00hH6tFgYMmHO7L95EEefSSea7ZRgnk1tVeVnP8PnnOK1
         AiYmSWgIngCshMx4ilY40IIXsLBhYw4ZMy6zyM00CrqwiQSeoosSFF5JEZDLyEuaLSzr
         rBivfS9t+DKtLFHtsLzF7prLDfc5rtYIhZp5/HQl5XjXmP4bBxgT2n2NVDgY4vLIokZD
         nH97OrKW1zhcNAUv4TWk4ejiiOhf1chSZiYz5U09oEl9A4n24ZSAmEiP0hOY0P1UYlIo
         QXagDRPrQWSpW3JoWJVNmNJh66MQtBmBsjZGhfhjJM1OVXWjHamiyuG6vC4pmroxec8I
         gt1g==
X-Forwarded-Encrypted: i=1; AKwUvBzgyrQ5UyQwfTUp/h8O27AGnIScndfYodVQV1t60oqUgeov/GdnYVv6YdKXsynA1irl2EtU32XnJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLHA8W/Jfa38oF5q+EwzHXHXohPxdsPeD/sER08PsuWy86qmBzI
	lCCWeyl890WFC4zaBDr/O6kZkQO/VgXcUN945l1ylfJuFNzSn0TFz0VRylb5PKBpt2Qbj/ACnCQ
	TnDGUJ5ZMlcuofoPsUQ9ufMyMFmSeaQozAsZS3iv4MAMwBRlIjeEeGFJEumMD0GZSferGDGU=
X-Gm-Gg: AYBFou1kM4u7RO9tPMabkg+UJW+MzN/0/p6RnlmkSpDEKdvsS9+nw6hz7BXLY8ej6tL
	XzuWTytI9zy+prDbTIkj4Xi2SVOjFOJMJdtbGzBuzGOAlzmmsnahS5KP81+o/1IaSoKGvtB4bnM
	eeWaIdxEgUpgKS/NF8w1M+wnn5fgPwCQGOiZZ1J0se3SPSeg9PqKzD+KKz7q40TGd2EWJq21ZOm
	DCa2Etz2/16LTcNtU47xOSVw9btmz6aR6Ww+16GdmHNb0qvrKDOvCMaBqYUZZbaV22FkmVpi48J
	Xy6ODkazjOe7Ag1pMiFco1ZdVfk/HBad9seim09uLW6BhK+OGD1sOw==
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548294e0c.21.1791829927036;
        Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548281e0c.21.1791829926536;
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm5764908e0c.0.2026.10.12.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:32:04 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Message-ID: <20261012183204.c845fc69@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jh618c7azznbt1i9HkBoHNRiwY1MFb_kaaBuAbb6qs0_1791829927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Sat, Oct 10, 2026 at 03:08:35AM +0800, Shengyu Qu wrote:
> Hi,
> 
> I don't think doing like this is correct.. We have a dedicated M.2 Ekey
> binding and should use that:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> 
> Best regards,
> Shengyu

To my understanding, the pwrseq-pcie-m2 driver that uses this binding
currently only supports systems that use UART for Bluetooth, and is
needed for them because UART is a non-discoverable bus. Quoting the
cover letter of the series that introduced this binding:

"This series adds support for connectors that expose PCIe interface for
WiFi and UART interface for BT. Other interfaces are left for future
improvements." [1]

K3 CoM260 Dev Kit ships with its E-key slot populated with an RTL8852BE
module, which uses PCIe for WiFi and USB2 for BT. I verified that my
patch series does make the rfkill command be able to disconnect and
reconnect the WiFi and BT devices with this module. I also tested this
patch set with an Intel AX210.

In addition to PCIe and USB2, this board also has its M.2 E-key slot
connected to sdio, uart6, and i2s3, but none of those are currently
enabled in this dts and the RTL8852BE module does not use them.

Several other existing device trees seem to use rfkill-gpio nodes to
control W_DISABLE pins on M.2 E-key slots. Looking at rk3588 boards for
example: OrangePi 5 Plus, ArmSoM W3, and Rock 5B all do so in the
current tree.

Unlike those, the rfkill nodes in my patch aren't actually necessary for
usable WiFi and BT on this board. The shutdown-gpios here are
GPIO_ACTIVE_LOW and this merely allows using rfkill to block both radios
via the W_DISABLE pins, so I'm not opposed to dropping this patch if
anyone believes it should be dropped.

[1] https://lore.kernel.org/lkml/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

> 
> 在 2026/9/29 07:18, Jennifer Berringer 写道:
> > K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
> > the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
> > WLAN and Bluetooth.
> > 
> > Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > index 01e286cb05797..cd878340e5add 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > @@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >   		regulator-max-microvolt = <3300000>;
> >   		regulator-always-on;
> >   	};
> > +
> > +	rfkill-pcie-wlan {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-pcie-wlan";
> > +		radio-type = "wlan";
> > +		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	rfkill-usb-bt {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-usb-bt";
> > +		radio-type = "bluetooth";
> > +		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
> > +	};
> >   };
> >   &combophy {
> 

