Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A82C08BB
	for <spacemit@lists.linux.dev>; Wed, 22 Apr 2026 05:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837435; cv=pass; b=WT6/zPxPHu59fv//YMtJM6nCcx1QcE682iNYiscnlrxw/+VVlfgVDazbx7kgcsepTlS63OvNxxQIrNXkJo5K+288lu2XDe/YqNsV+TbqzDlnJwioM8Dlf6gyXGfIwKR36QA/9zjTWcKo3LnvQenhSH8qM9Yv1I+iEbwSeVaY5sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837435; c=relaxed/simple;
	bh=son5GUfBCXkJka3b7rHSwRZcR0H7LmRjWetn/EiAmVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiyZc08f0LiB7qDmr88/hJMLh73RylfUY1kBFFyKy6Rjy0vJ/KsBsvmDHCM+KeyRPnBkvb6QEByW3rCCcxLV99rBp6iDg77U+isVGixVLR6z4RQtTyk2wXBniyx3OMxSmtOzHLIPHWihtz0U6CbS5NsUxoAiD3EjP9KgVPlhRHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfpPoEQB; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfpPoEQB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso698008966b.3
        for <spacemit@lists.linux.dev>; Tue, 21 Apr 2026 22:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776837432; cv=none;
        d=google.com; s=arc-20240605;
        b=IMUfOf1IskTiuubwVbi68vSvrC9KSJgG9e/t03ukYVa78oF6CVsiSWjGYhGbdHLFa2
         c6i1b7mVMXcK3NKTak51i+AXwf+xcfkRLS6Gm6JQ3iO2fplby3U8PB5hMiOAkO6+nqV5
         IEYXgm3vFGa05ITw/ZhhtNahOs8aP5hO7otHI+Y2EyXREBjEXSVSWqT6r2aQobIL1GSD
         xQ/NRabGHTShKvFwYItjG0jJaRbtehYxdruv3zFcl9NMZaw1lBWb7sq3WGH95QpQtzNn
         lM2M6QjNcfHxrIG+PGBxzsWsLQqVhrzJSExhK62BzfWGsED7kHqfA+lyBEyE3BtUi91o
         xceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        fh=GewJKU8arudsgFkYEFckzXyJNA1GkTFDCwxx5fPdfig=;
        b=G96vZ7papFViJ+sC50MfDjYMetERjXRAk93icE6cCjqIByxdgdGyQUBaD7WkcQ0JJI
         4fVp5XvfRAT67ZADzZ2JUN105dFXBUnHCQTyY9HGotwipDOM+0JpuHSZdrR0rFd+FFi4
         lhJGO38hbU79w9EqQXhxf+cxq3H0o8SWLnI7jl31DleJqBFHAvV6342DocprjFaMx31R
         82HQMViPjJc95IACg0byN2rQMEKgAijFnOI8FdCqbIZPGYhetcsB/QUNhcuFtFFGGMpj
         yOwxyffcsnJD/3IpzOXspmhKI5wbhJhX4Fctx75DU4CAE2VXBUFNLBsgPy2ePWBVTUq0
         JmfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776837432; x=1777442232; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=EfpPoEQBDgU1owL0nLk1KeXmgJZTImDtTr3EwJfFQqfD6UVLTDRqEEExmOvZVxlzHm
         vrmDcwISErn2ev22ZvzyYQv4CcCIJcqO9vh/zz0TmfnuMUYgQGJeK/NfWGeJcRw9LbcT
         viMEeWeu1fa0s9tz0RnvvhTLLxar/przsL3orYTLFWC7I6zKqmv5qcRryD4htRtNsXUp
         07NNSjJL11WV7I89LhZNislKNOtozu7mGkzsym15s+OGub2UhxfCoJeZvDNpRE/CtWF4
         tnBCfN6m6TUiqsONczOa8lM6SGnSQhBK1XjbaHz9YLWEV1xNN9TAqx7Ri6p1rdBacAmf
         1FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837432; x=1777442232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mfQrHmJg8pkYiq0O9V0bit0vPU2fxUi56Y7yDGTSLA=;
        b=fCyBlhevWPmljFNmAORM7PZ7CLKi+Sj3RJO6gjtZ1A+9k7ETPH6mDnRaVdKJ9oOBPX
         IeLJJ7ruz4y3Eck8bYO0CMnETs+pwqRG3m8E2DV5iMJ1rK+MGMENfvMLo2wA0U6R/D4d
         Stv2suDwXeNNy4HUrAcOcqyEExAFEMljxiCL0aY/o0oRn6HVqRVh1X7x9HMUjBMvqh8X
         TTFiT4/jOf680dv4kOEjrXcTlji1c0pgIQS6gF4zmcAHeNroLPt9nAaAldsVUy0bMHze
         QU8OUkqAAHzXDNgXGjK7W+4zJYQYn/f8+oqONOIOOWne3DRXToWpoo2BUh7HyniVKZfy
         07qg==
X-Forwarded-Encrypted: i=1; AFNElJ//BUbTlpWsoBRYi/pQkfAPIoq53x8SgkPe01LuBUnTvggy4SGp4HBoCx5p/ntQsl5kjHHf/vAIiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRHFOHX2BIxY0YM5JbPihzKEJCfM4WQCGOqwP7z98FrUVbkdv9
	zON+TWVyJ3NWmvqgXXoUHbXFZxIusenkvMjlok2LbenEAmg8Kl2p/jBHMeEgry2EVk4kql3878Z
	pdDc7By5lQs5674CKnVdGxtsrusYbBe0=
X-Gm-Gg: AeBDievqbpJc4Dwg2zvq16o4lquRSs98FikYvmhft8o2e/4vAl4xyc/nQVoDTtTrIXe
	vRiaJ5Q3TGdQYP/8zFgn/PERMzaBN1stymysTji4cFD4jcvWUzEXb/xa6+OwrzNbbUUtay8bIdq
	BTPqO7wf8iemvN9O2yVjUrmiYozvZ3GcMr0t9i93gDRXCLQU3CJXc5fiM3ga9QFVYPgqRtJGPmm
	BIiEpywhmPBIiBQs7+5zfs1Gf9xQMjSRogVY4nS3lSOQqIlpITvwE5/ZD7I+pev357NFx7VX3Tw
	WKBSqO4P4tIFt0M=
X-Received: by 2002:a17:907:d09:b0:ba7:7a1f:1096 with SMTP id
 a640c23a62f3a-ba77a1f52a9mr604591266b.19.1776837432114; Tue, 21 Apr 2026
 22:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 22 Apr 2026 11:26:56 +0530
X-Gm-Features: AQROBzAs7FAeBD4enf-d2fMmvL5o4M1AgFGifNPyDM3Z4riMQcMNULcXuvp1c4I
Message-ID: <CANAwSgTOmbb+Vzhck1riVaFM89zYLdMe3dn6DRHrc7p+rkR2DQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> with definitions for registers, clocks, and interrupts.
> Additionally, configure thermal zones for the soc, package, gpu, and
> clusters to enable temperature monitoring via the thermal framework.
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
> ---
> Changes in v2:
> - Update compatible to "spacemit,k1-tsensor"
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6..0fe7396ea6e4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -338,6 +338,96 @@ osc_32k: clock-32k {
>                 };
>         };
>
I feel the thermal zones appear to be configured at significantly
higher temperatures
compared to the thresholds typically used in commercial-grade and
industrial-grade device
test environments 1.2 Test Environment

[1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_hw/avl_veri_sop.md

Thermal zones should be defined as part of the SBC board design,
with the option to integrate PWM-controlled fan support in the future.

Thanks
-Anand
> +       thermal-zones {
> +               soc-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 0>;
> +
> +                       trips {
> +                               soc-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               package-thermal {
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 1>;
> +
> +                       trips {
> +                               package-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               gpu-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 2>;
> +
> +                       trips {
> +                               gpu-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               gpu-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster0-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 3>;
> +
> +                       trips {
> +                               cluster0-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster0-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cluster1-thermal {
> +                       polling-delay-passive = <100>;
> +                       polling-delay = <0>;
> +                       thermal-sensors = <&thermal 4>;
> +
> +                       trips {
> +                               cluster1-alert {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cluster1-crit {
> +                                       temperature = <115000>;
> +                                       hysteresis = <0>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +       };
> +
>         soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&plic>;
> @@ -434,6 +524,17 @@ syscon_apbc: system-controller@d4015000 {
>                         #reset-cells = <1>;
>                 };
>
> +               thermal: thermal@d4018000 {
> +                       compatible = "spacemit,k1-tsensor";
> +                       reg = <0x0 0xd4018000 0x0 0x100>;
> +                       clocks = <&syscon_apbc CLK_TSEN>,
> +                                <&syscon_apbc CLK_TSEN_BUS>;
> +                       clock-names = "core", "bus";
> +                       interrupts = <61>;
> +                       resets = <&syscon_apbc RESET_TSEN>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 i2c6: i2c@d4018800 {
>                         compatible = "spacemit,k1-i2c";
>                         reg = <0x0 0xd4018800 0x0 0x38>;
>
> --
> 2.52.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
