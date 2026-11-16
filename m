Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814591;
	b=c9X/9CQdmloYzRU3lOadCEBH1Iq7boTbvp4E3yz46oIHDW2Go1MdT3a3S6ygS7d5BxKk
	 XXaHZWEXuTVYyVNTQZzMUogsfYMplgrSJM32cszA2qreHGUnD+xAxeYzmfqkFXbARNWky
	 Zxhn5Ko45kxg03kL/YergA2ureBgBMtM55HMfiMAhaOvBxE/RYxrkacP7nxXmyCrTMv5E
	 gR+R1r2zYWl76vUS4pWmbEJMM4CqhD+727zQoRCQl7I2ZkZnAassDhPSEHnFmcoF+Xxi8
	 91mu6Z2jHnLcdrU2wycVQlMk5YAkus5X9duoHiOwqKfKXwdkStrsJGhiTPjbGDOc2zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
	b=Wm30/3N9RYLEyAqcl8M3KDL3eYGFp1jxRrQdcrav6RzHR2naN1+Lu7AVyPdhl6x/ge6Z
	 Vg2lcw7EqD4d/nHncLVHOq9ABK0ZSRzY3/L2bt4um4866+yo46zt6+MLTKz9g2CPcwhOG
	 aV+8plF3dm0OEXIWsEVLr9ksml6ZoIjzmushN+O7qHwfvdSiDHcDV+06ju6IPHtUt2kT9
	 PciKxbX65UhNNfRNE1PbcBMzm1Z3oBmxeU56Ale7JVHQMFui4DDRARCFELCCewm/6vDwa
	 fbHbA/uvOO3ZTyctzRCqHknki2VqndnJASkJPc9KBIv5HrB2/Lvahv9lckqdugK6MWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cK3ebaaJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5A606A8A7
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 07:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF5A606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cK3ebaaJ
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so3785536a12.0
        for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 23:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794814583; cv=none;
        d=google.com; s=arc-20260327;
        b=AllZQl16JAFU9LkgUwPTat851UWiLzg8NMK82DO6+TNkxH4QCOyLOSK4YHetHOsaFR
         ayZCXTIVoqqjb+sjNsPzPEIRIcqzovaqsQKxFpyNVe6pQEzZMbyU3kWvkbWDDxlMewXq
         irtlem2m4aykcH2QyjTJFFCTzms27ZQZItMX75CULOxh7LV2BbRbSD+dAVYKH30oDTC7
         5i95DulV2UHTDB2lrsyoYYHx08Io3yARVz6DoICuM/jihXxovafuK37aofb5T9soNNqV
         pYy/HHKvXkbwGtV8A7hg6YdLKn8RliD5jvxMZ1XNvTSQWk8/TYDLeU0ncHVfS30ZL94y
         YxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        fh=mQsTp+9t2H/IIM+9Q7cjS1CRy+Ny2JbZ1pm/YI6ISWg=;
        b=NJcklKZEQAAaILdWpMMN81HMn4+1IgWcq2meqA6UOdMf1dVvH4B0VEo6g5IESrGVgi
         gjnZx0zhsjhXDmTO8pVy+07Iesuzbp+aSsnArOx1iWuPwSWR89gugs34SMs+3avbnk+X
         LAokiLWnqkY9LO5iZFtrWwrNmKIDsqzKUYrtHYfxU/p6KulCdd2wljeArgMdW4FXLS6o
         DMr12LV1y6ihUow8Kwac6qvTLdpCMYEAo7xy2osG4dA0k4jscjmDTKMDiySPRV0l6yXx
         K2pGb+umLyTKnqCFs+C1vT1uJJWfLqmYihJSx0ui8q9xvzObfSgcosZ+2LwixuZlbQHw
         KZLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814583; x=1795419383; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=cK3ebaaJsI+gerODnshGkREwB0Jb/0cSoO1c8FpogA4KjGlUOjxq6yEfRbEFpt8Ncg
         V18bgDhDG9uykzDeI/puvKimrsJdXNbi2V0+UfO64n3D9VZxJpNZykjt9cp326wi9O9f
         4SVNeQD3TpVePJ2k52WhtqSbJbAPhVkO8zfyE2J/4IVt6L4NPq/y+VWLEAOz87wNSdkM
         fHYIuusCfZiv5e8lRKwTtZ1EzW6iH8mmzJuOGQhAbIOSL+o6ikJyHMoCmTlp4R6WoJVZ
         Wk7GMOuCfJlz1zUUC4wjYJ2uCzxSz+uwjLbQKCmWpfQ98QDeAmfoFmBwPGb02PkF9gJT
         EsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814583; x=1795419383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=iLr0YuZE/zAkQ7lSRkgEgN+WoYymuF17ugwQcEihFJIOtlmC3UIPC0RFRLZ9cV9tlm
         owenuAofUbTCrf+MCA/0JZQtDdWi33YYwmdFi59LHwcGG+fZ1mGV/3IXE+rrEjA9r+7K
         QY5DXebjcoUH3/n1YLNi6p8Rs5EwTVql5m6nI4SGbkh8z8q5pATScq2jFz4d5yq7HPjb
         szdXHPRmOf3zRTsMpPTncO2t82UAT/bR3kHS/KiJAwR+djNPfBMJqKXLMK34SpSPVlTj
         GvrVvqaqqG31TBg7A6UmpKHOUl39PLj/yGK7c1HRzZF0gIeHIg8lmdHxmjsoHtSpkB7E
         5qZw==
X-Forwarded-Encrypted: i=1; AL+hErEpDro7tUUP+mtHPChJjxAJU9BGmyL7jIbN05ley1G49+LsUXNiq5z92Fq78G8OgMupcMVjUPsY5g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9kQdyIGlQO3Ec752CK0rU6bprRO5V/aCw/NidbOkmB3vdh3fwt
	jvlOZp+JS1uG2kAdI5bN7vY8UuWKOe/4BqtT543XgeWJNNJsG5eLFEXusFRNtAe9fMDXCfgZn5o
	iOXFWydmgAKGTTvns3OxgiHE4HWIcMQw=
X-Gm-Gg: AYBFou08OYNNeoYM8rUw9d7eS+drDZF/MQDidr850tDxguBPYepKp0/HtHRxPW61mrc
	M+vBYar0iDj/Qo83ucvhdpnlvoTnlWgyuNryTtY6SwATVXw2Jcgqz1v8OtKrEf2eshd1DLJppNs
	T22SLXJ3pzkePGeLHTNJ6OyGG046uEAwtoqe4wKjywWSo/PzWidFwr41n+YXFtwMoxxO44MPQNs
	ECpOaLp6pEJxitbcv4hnFXmmg1ikAT/VxVDFfV2+V32XJSlnzJJwkO+x97UtzblRoT/TweoO9kH
	NyxUH9fvFwaJPEOvBr8T5YmP3eq+AE+wS0f2VnswrOC3JH2IVEf5zPWnQ3heByvMTLpmJ7GYIEw
	6E9dFTbRw4t4/kZn1dBTaENXWANPWugk2yjh6FmVHhu8/a48qrcW8j+gs
X-Received: by 2002:a05:6402:5d4:b0:6b5:5fc8:9ca2 with SMTP id
 4fb4d7f45d1cf-6b7c0c7dc86mr6801231a12.34.1794814582850; Sun, 15 Nov 2026
 23:36:22 -0800 (PST)
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
 <avpN-gFOvTBAMY6G@venus>
In-Reply-To: <avpN-gFOvTBAMY6G@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 16 Nov 2026 13:06:08 +0530
X-Gm-Features: AclHuK_zi0cJ5esU4k_l4Yl1mv76j_qYKuptpaeB4AEIgcR7sleibDfPZTNW_HY
Message-ID: <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > to access the PMIC. However, these handlers run in an atomic notifier
> > context (specifically within an rcu_read_lock() critical section), while
> > the I2C-backed regmap uses a sleepable mutex.
> >
> > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > context switch in the RCU read-side critical section during shutdown on the
> > Banana Pi BPI-F3:
> >
> > [  563.803475] WARNING: suspicious RCU usage
> > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > ...
> > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> >
> > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > in an atomic context. Preserve unrelated register bits through
> > read-modify-write operations and check for atomic I2C support before
> > registering the handlers.
> >
> > Obtain the I2C client from the parent device and verify that the adapter
> > supports atomic transfers before registering the handlers.
> >
> > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> >
> > Assisted-by: LLM
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
>
> regmap runs i2c_transfer itself and thus also uses the atomic I2C
> transfers. The problem here is regmap itself. But instead of moving
> away from regmap, the atomic use case should be supported properly
> in regmap.
>

On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
through the SBI System Reset (SRST) extension. Linux delegates these
operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
for reboot, depending on the supported reset type.

Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
on this platform, as it duplicates functionality already provided by firmware.

While supporting atomic operations in regmap may be useful more generally,
it is not necessary to address this platform's shutdown and reboot requirements.

I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
poweroff/reboot driver.

OpenSBI commit which handles this extension

d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")

Similarly, on the StarFive VisionFive 2, poweroff is handled by
OpenSBI through the
AXP15060 PMIC, so there is no need to register an additional poweroff
handler using
devm_register_power_off_handler().

OpenSBI commit which handles this extension

568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
visionfive2 board")

-----8<----------8<----------8<------
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e06..069259f7d7c15 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
                return ret;
        }

-       if (axp20x->variant != AXP288_ID)
-               devm_register_power_off_handler(axp20x->dev,
axp20x_power_off, axp20x);
+       /*
+        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
+        * Avoid accessing the I2C PMIC from the atomic poweroff path.
+        */
+       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
+                               of_machine_is_compatible("starfive,jh7110")))
+               devm_register_power_off_handler(axp20x->dev,
+                               axp20x_power_off, axp20x);

        dev_info(axp20x->dev, "AXP20X driver loaded\n");

Please let me know if this works on your board?
>
> -- Sebastian

Thanks
-Anand
